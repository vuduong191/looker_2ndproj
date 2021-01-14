
view: variant_daily_sales_2 {
  derived_table: {
    explore_source: variant_daily_sales {
      column: current_date_number_445_end_constant { field: find_date_number_2.current_date_number_445_end_constant }
      column: current_date_number_445_start_constant { field: find_date_number_2.current_date_number_445_start_constant }
      column: created_autz_date {}
      column: category {}
      column: color {}
      column: _445_month {}
      column: _445_quarter {}
      column: _445_week {}
      column: _445_year {}
      column: date_number_445_full {}
      column: material {}
      column: order_name {}
      column: product {}
      column: size {}
      column: product_variant_sku {}
      column: total_pre_tax_price {}
      column: total_unit_sold {}
      timezone: query_timezone
      bind_filters: {
        to_field: variant_daily_sales.current_date_range
        from_field: variant_daily_sales_2.current_date_range
      }
    }
    # persist_for: "24 hours" --- Does not work
  }

  dimension: current_date_number_445_end_constant {
    # hidden: yes
    type: number
  }
  dimension: current_date_number_445_start_constant {
    # hidden: yes
    type: number
  }
  dimension: current_date_445_year {
    hidden: yes
    type: number
    sql: FLOOR(${current_date_number_445_start_constant}/1000000);;
  }
  dimension: current_date_445_week {
    type: number
    hidden: yes
    sql: CAST(RIGHT(${current_date_number_445_start_constant}, 2) AS INT64);;
  }
  dimension: current_date_445_month {
    type: number
    hidden: yes
    sql: MOD(CAST(FLOOR(${current_date_number_445_start_constant}/100) AS INT64),100);;
  }
  dimension: current_date_445_quarter {
    type: number
    hidden: yes
    sql: MOD(CAST(FLOOR(${current_date_number_445_start_constant}/10000) AS INT64),100);;
  }
  dimension: last_quarter_date_num_start {
    type: number
    # hidden: yes
    sql:  CASE
            WHEN ${current_date_445_month}<4 THEN (${current_date_445_year}-1)*1000000+40000+1000
            ELSE ${current_date_445_year}*1000000+(${current_date_445_quarter}-1)*10000
          END;;
  }
  dimension: last_month_date_num_start {
    type: number
    # hidden: yes
    sql:  CASE
            WHEN ${current_date_445_month}=1 THEN (${current_date_445_year}-1)*1000000+40000+1200
            ELSE ${current_date_445_year}*1000000+${current_date_445_quarter}*10000+ (${current_date_445_month}-1)*100
          END;;
  }
  dimension: last_year_date_number_selected_start {
    hidden: yes
    type: number
    # hidden: yes
    sql: ${current_date_number_445_start_constant}-1000000 ;;
  }
  dimension: last_year_date_number_selected_end  {
    hidden: yes
    # hidden: yes
    type: number
    sql: ${current_date_number_445_end_constant}-1000000 ;;
  }

  dimension: created_autz_date {
    type: date
    convert_tz: no
  }
  dimension: category {}
  dimension: color {}
  dimension: _445_month {}
  dimension: _445_quarter {}
  dimension: _445_week {}
  dimension: _445_year {}
  dimension: date_number_445_full {}
  dimension: material {}
  dimension: order_name {}
  dimension: product {}
  dimension: size {}
  dimension: product_variant_sku {
    label: "Variant SKU"
  }
  dimension: category_custom_sort {
    label: "Category (Custom Sort)"
    case: {
      when: {
        sql: ${category} = 'Bedding' ;;
        label: "Bedding"
      }
      when: {
        sql: ${category} = "Women's Wear" ;;
        label: "Women's Wear"
      }
      when: {
        sql: ${category} = 'Accessory' ;;
        label: "Accessory"
      }
      when: {
        sql: ${category} = 'Bath' ;;
        label: "Bath"
      }
      when: {
        sql: ${category} = "Men's Wear"  ;;
        label: "Men's Wear"
      }

      else: "not_considered"
    }
  }
  dimension: date_number_445_quarter {
    type: number
    sql: CAST(FLOOR(${date_number_445_full}/10000) AS INT64);;
  }

  dimension: _445_quarter_text {
    type: string
    sql: CONCAT(${_445_year}, "-Q", ${_445_quarter}) ;;
  }



  measure: total_pre_tax_price  {
    description: "Net Sales"
    value_format: "$#,##0.00"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.total_pre_tax_price  ;;
  }
  measure: total_unit_sold  {
    description: "Units sold"
    value_format: "#,##0"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.total_unit_sold  ;;
  }
  measure: order_count {
    value_format: "$#,##0"
    type: count_distinct
    drill_fields: [detail*]
    sql: ${TABLE}.order_name ;;
  }

  filter: current_date_range {
    type: date
    view_label: "_PoP"
    convert_tz: no
    label: "1. Current Date Range"
    # sql: ${period} IS NOT NULL ;;
  }
  dimension: period {
    view_label: "_PoP"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %}
            THEN 'This '
            WHEN DATE(TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles")) between ${period_2_start} and ${period_2_end}
            THEN 'Last period'
            WHEN (CAST(${date_number_445_full} AS INT64) >= CAST(${last_year_date_number_selected_start} AS INT64)) AND (CAST(${date_number_445_full} AS INT64) <= CAST(${last_year_date_number_selected_end} AS INT64)) THEN 'Last year'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }


  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %} THEN 'this'
            WHEN DATE(TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles")) between ${period_2_start} and ${period_2_end} THEN 'last'
            WHEN ${date_number_445_full} BETWEEN ${last_year_date_number_selected_start} AND ${last_year_date_number_selected_end} THEN 'last year'
            END
        {% else %} NULL {% endif %} ;;
  }
  dimension: month_filtered_measures {
    # hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN ${date_number_445_full} >=  (FLOOR(${current_date_number_445_end_constant}/100)*100) AND ${date_number_445_full} <= ${current_date_number_445_end_constant} THEN 'mtd'
            WHEN ${date_number_445_full} >= ${last_month_date_num_start} AND ${date_number_445_full} < (FLOOR(${current_date_number_445_end_constant}/100)*100) THEN 'last month'
            END
        {% else %} NULL {% endif %} ;;
  }
  dimension: quarter_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN ${date_number_445_full} >=  ${last_quarter_date_num_start} AND ${date_number_445_full} < (${last_quarter_date_num_start} + 10000) THEN 'last quarter'
            WHEN ${date_number_445_full} >= (${last_quarter_date_num_start}-1000000) AND ${date_number_445_full} < (${last_quarter_date_num_start} + 10000 - 1000000) THEN 'same quarter last year'
            END
        {% else %} NULL {% endif %} ;;
  }
  dimension: days_in_period {
    # hidden:  yes
    view_label: "_PoP"
    description: "Gives the number of days in the current period date range"
    type: number
    sql: DATE_DIFF(DATE({% date_end current_date_range %}), DATE({% date_start current_date_range %}), DAY) ;;
  }
  dimension: period_2_start {
    # hidden:  yes
    view_label: "_PoP"
    description: "Calculates the start of the previous period"
    type: date
    convert_tz: no
    sql:DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -${days_in_period} DAY);;
  }

  dimension: period_2_end {
    # hidden:  yes
    convert_tz: no
    view_label: "_PoP"
    description: "Calculates the end of the previous period"
    type: date
    sql:DATE_ADD(DATE({% date_start current_date_range %}), INTERVAL -1 DAY) ;;
  }
# Filtered measures


# Net Sales Metrics
  measure: current_period_net_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_pre_tax_price;;
    filters: {
      field: period_filtered_measures
      value: "this"
    }
  }

  measure: previous_period_net_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_pre_tax_price;;
    filters: {
      field: period_filtered_measures
      value: "last"
    }
  }
  measure: same_period_last_year_net_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_pre_tax_price;;
    filters: {
      field: period_filtered_measures
      value: "last year"
    }
  }
  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_net_sales} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_net_sales} / NULLIF(${previous_period_net_sales} ,0)) - 1 END ;;
    value_format_name: percent_2
  }
  measure: sales_yoy_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_net_sales} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_net_sales} / NULLIF(${same_period_last_year_net_sales} ,0)) - 1 END ;;
    value_format_name: percent_2
  }

# Quantity Metrics
  measure: current_period_units_sold {
    view_label: "_PoP"
    value_format: "#,##0"
    type: sum
    sql: ${TABLE}.total_unit_sold;;
    filters: {
      field: period_filtered_measures
      value: "this"
    }
  }

  measure: previous_period_units_sold {
    view_label: "_PoP"
    value_format: "#,##0"
    type: sum
    sql: ${TABLE}.total_unit_sold;;
    filters: {
      field: period_filtered_measures
      value: "last"
    }
  }
  measure: same_period_last_year_units_sold {
    view_label: "_PoP"
    value_format: "#,##0"
    type: sum
    sql: ${TABLE}.total_unit_sold;;
    filters: {
      field: period_filtered_measures
      value: "last year"
    }
  }
  measure: units_sold_pop_change {
    view_label: "_PoP"
    label: "Total units sold period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_units_sold} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_units_sold} / NULLIF(${previous_period_units_sold} ,0)) - 1 END ;;
    value_format_name: percent_2
  }
  measure: units_sold_yoy_change {
    view_label: "_PoP"
    label: "Total units sold period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_units_sold} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_units_sold} / NULLIF(${same_period_last_year_units_sold} ,0)) - 1 END ;;
    value_format_name: percent_2
  }
  measure: last_day {
    type: date
    sql: MAX(${created_autz_date}) ;;
    convert_tz: no
  }
  parameter: product_grouping_picker {
    label: "Product Grouping"
    type: string
    allowed_value: { value: "Category" }
    allowed_value: { value: "Category-Product" }
    allowed_value: { value: "Product" }
    allowed_value: { value: "Product-Size" }
    allowed_value: { value: "Product-Color" }
    allowed_value: { value: "Category-Size" }
    allowed_value: { value: "Category-Color" }
    allowed_value: {  value: "SKU-Product-Size-Color" }
    default_value: "Product"
  }
  dimension: dynamic_product_grouping {
    type: string
    sql:
    CASE
      WHEN {% parameter product_grouping_picker %} = 'Category' THEN CONCAT(IFNULL(${category},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Product' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${product},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Size' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${size},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Color' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product' THEN CONCAT(IFNULL(${product},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Size' THEN CONCAT(IFNULL(${product},"na"),"-", IFNULL(${size},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Color' THEN CONCAT(IFNULL(${product},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'SKU-Product-Size-Color' THEN CONCAT(IFNULL(${product_variant_sku},"na"),"-",IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"))
    END ;;
  }
  dimension: pk_to_lookup {
    # hidden: yes
    sql: ${product_variant_sku} || ${created_autz_date} ;;
  }
  dimension: _445_month_text {
    type: string
    sql: CONCAT(${_445_year},"-", FORMAT("%02d", ${_445_month})) ;;
  }
  dimension: _445_week_text {
    type: string
    sql: CONCAT(${_445_year}, "-W", FORMAT("%02d", ${_445_week})) ;;
  }
  measure: _445_week_text_w_start_date {
    type: string
    sql: CONCAT(${_445_year}, "-W", FORMAT("%02d", ${_445_week}),"-", FORMAT_DATE("%b-%d", ${last_day})) ;;
  }
# Refund Metrics

  # measure: current_period_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: period_filtered_measures
  #     value: "this"
  #   }
  # }

  # measure: previous_period_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: period_filtered_measures
  #     value: "last"
  #   }
  # }
  # measure: same_period_last_year_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: period_filtered_measures
  #     value: "last year"
  #   }
  # }
  # measure: sum_of_refund_amount_pop_change {
  #   view_label: "_PoP"
  #   label: "Refund period-over-period % change"
  #   type: number
  #   sql: CASE WHEN ${current_period_sum_of_refund_amount} = 0
  #         THEN NULL
  #         ELSE (1.0 * ${current_period_sum_of_refund_amount} / NULLIF(${previous_period_sum_of_refund_amount} ,0)) - 1 END ;;
  #   value_format_name: percent_2
  # }
  # measure: sum_of_refund_amount_yoy_change {
  #   view_label: "_PoP"
  #   label: "Refund period-over-period % change"
  #   type: number
  #   sql: CASE WHEN ${current_period_sum_of_refund_amount} = 0
  #         THEN NULL
  #         ELSE (1.0 * ${current_period_sum_of_refund_amount} / NULLIF(${same_period_last_year_sum_of_refund_amount} ,0)) - 1 END ;;
  #   value_format_name: percent_2
  # }
  # measure: mtd_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: month_filtered_measures
  #     value: "mtd"
  #   }
  # }
  # measure: mtd_week_count{
  #   view_label: "_PoP"
  #   type: count_distinct
  #   sql: ${TABLE}.445_week;;
  #   filters: {
  #     field: month_filtered_measures
  #     value: "mtd"
  #   }
  # }
  # measure: last_month_week_count {
  #   view_label: "_PoP"
  #   type: count_distinct
  #   sql: ${TABLE}.445_week;;
  #   filters: {
  #     field: month_filtered_measures
  #     value: "last month"
  #   }
  # }
  # measure: last_month_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: month_filtered_measures
  #     value: "last month"
  #   }
  # }
  # measure: last_quarter_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: quarter_filtered_measures
  #     value: "last quarter"
  #   }
  # }
  # measure: same_quarter_ly_sum_of_refund_amount {
  #   view_label: "_PoP"
  #   value_format: "$#,##0.00"
  #   type: sum
  #   sql: ${TABLE}.sum_of_refund_amount;;
  #   filters: {
  #     field: quarter_filtered_measures
  #     value: "same quarter last year"
  #   }
  # }

  set: detail {
    fields: [
      product_variant_sku,
      created_autz_date,
      total_unit_sold,
      order_name
    ]
  }
}
