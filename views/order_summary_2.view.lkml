
view: order_summary_2 {
  derived_table: {
    explore_source: order_summary {
      column: current_date_number_445_end_constant { field: find_date_number.current_date_number_445_end_constant }
      column: current_date_number_445_start_constant { field: find_date_number.current_date_number_445_start_constant }
      column: 445_month {}
      column: 445_quarter {}
      column: 445_week {}
      column: 445_year {}
      # column: current_date_number_445_start {}
      # column: current_date_number_445_end {}
      column: date_number_445_full {}
      column: date_simple {}
      column: count_of_order {}
      column: sum_of_net_sales {}
      column: sum_of_subtotal_price {}
      column: sum_of_total_discounts {}
      column: sum_of_total_line_items_price {}
      column: sum_of_total_price {}
      column: sum_of_total_tax {}
      column: sum_of_refund_amount { field: daily_refund.sum_of_refund_amount }
      column: refund_order_distinct_count {field: daily_refund.order_distinct_count}
      timezone: query_timezone
      bind_filters: {
        to_field: order_summary.current_date_range
        from_field: order_summary_2.current_date_range
      }
    }
  }

  dimension: current_date_number_445_end_constant {
    type: number
  }
  dimension: current_date_number_445_start_constant {
    type: number
  }
  dimension: 445_month {}
  dimension: 445_quarter {}
  dimension: 445_week {}
  dimension: 445_year {}

  dimension: date_number_445_full {}
  dimension: date_simple {
    description: "Date in Australia TZ"
    type: date
    convert_tz: no
  }
  measure: sum_of_net_sales {
    description: "tax excluded, shipping fee included"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_net_sales ;;
  }
  measure: sum_of_refund_amount {
    description: "Including tax collected"
    value_format: "$#,##0"
    type: sum
    sql: ${TABLE}.sum_of_refund_amount ;;
  }
  measure: sum_of_subtotal_price {
    description: "Sum(Line item prices) - Discount"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_subtotal_price ;;
  }
  measure: sum_of_total_discounts {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_total_discounts ;;
  }
  measure: sum_of_total_line_items_price {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_total_line_items_price ;;
  }
  measure: sum_of_total_price {
    description: "Subtotal Price + Shipping + Tax (if tax is not included)"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_total_price ;;
  }
  measure: sum_of_total_tax {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_total_tax ;;
  }
  measure: count_of_order {
    label: "Order Count"
    type: sum
    sql: ${TABLE}.count_of_order ;;
  }
  measure: count_of_refund_order {
    label: "Refund Order Count"
    type: sum
    value_format: "#"
    sql: ${TABLE}.refund_order_distinct_count ;;
  }
  dimension: vu_date_string {
    primary_key: yes
    hidden: yes
  }

  filter: date_time_to_filter_au_tz {
    type: date
    sql: {% condition date_time_to_filter_au_tz %} ${TABLE}.date_simple {% endcondition %} ;;
  }
  filter: date_time_to_filter_us_tz {
    type: date
    sql: {% condition date_time_to_filter_us_tz %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, "Australia/Melbourne")), "America/Los_Angeles") {% endcondition %};;
  }
  filter: current_date_range {
    type: date
    view_label: "_PoP"
    convert_tz: no
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    sql: ${period} IS NOT NULL ;;
  }
  dimension: period {
    view_label: "_PoP"
    label: "Period"
    description: "Pivot me! Returns the period the metric covers, i.e. either the 'This Period' or 'Previous Period'"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATE("%F", DATE(${TABLE}.date_simple, "Australia/Melbourne")), "America/Los_Angeles") {% endcondition %}
            THEN 'This '
            WHEN DATE(TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, "Australia/Melbourne")), "America/Los_Angeles")) between ${period_2_start} and ${period_2_end}
            THEN 'Last period'
            WHEN (CAST(${date_number_445_full} AS INT64) >= CAST(${last_year_date_number_selected_start} AS INT64)) AND (CAST(${date_number_445_full} AS INT64) <= CAST(${last_year_date_number_selected_end} AS INT64)) THEN 'Last year'
            END
        {% else %}
            NULL
        {% endif %}
        ;;
  }

  dimension: last_year_date_number_selected_start {
    type: number
    # hidden: yes
    sql: ${current_date_number_445_start_constant}-1000000 ;;
  }
  dimension: last_year_date_number_selected_end  {
    # hidden: yes
    type: number
    sql: ${current_date_number_445_end_constant}-1000000 ;;
  }
  dimension: period_filtered_measures {
    hidden: yes
    description: "We just use this for the filtered measures"
    type: string
    sql:
        {% if current_date_range._is_filtered %}
            CASE
            WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, "Australia/Melbourne")), "America/Los_Angeles") {% endcondition %} THEN 'this'
            WHEN DATE(TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, "Australia/Melbourne")), "America/Los_Angeles")) between ${period_2_start} and ${period_2_end} THEN 'last'
            WHEN ${date_number_445_full} BETWEEN ${last_year_date_number_selected_start} AND ${last_year_date_number_selected_end} THEN 'last year'
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
  measure: current_period_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_net_sales;;
    filters: {
      field: period_filtered_measures
      value: "this"
    }
  }

  measure: previous_period_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_net_sales;;
    filters: {
      field: period_filtered_measures
      value: "last"
    }
  }
  measure: same_period_last_year_sales {
    view_label: "_PoP"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_net_sales;;
    filters: {
      field: period_filtered_measures
      value: "last year"
    }
  }
  measure: sales_pop_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_sales} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_sales} / NULLIF(${previous_period_sales} ,0)) - 1 END ;;
    value_format_name: percent_2
  }
  measure: sales_yoy_change {
    view_label: "_PoP"
    label: "Total Sales period-over-period % change"
    type: number
    sql: CASE WHEN ${current_period_sales} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_sales} / NULLIF(${same_period_last_year_sales} ,0)) - 1 END ;;
    value_format_name: percent_2
  }

# Orders Metrics
measure: current_period_order_count {
  view_label: "_PoP"
  value_format: "#"
  type: sum
  sql: ${TABLE}.count_of_order;;
  filters: {
    field: period_filtered_measures
    value: "this"
  }
}

measure: previous_period_order_count {
  view_label: "_PoP"
  value_format: "#"
  type: sum
  sql: ${TABLE}.count_of_order;;
  filters: {
    field: period_filtered_measures
    value: "last"
  }
}
measure: same_period_last_year_order_count {
  view_label: "_PoP"
  value_format: "#"
  type: sum
  sql: ${TABLE}.count_of_order;;
  filters: {
    field: period_filtered_measures
    value: "last year"
  }
}
measure: order_count_pop_change {
  view_label: "_PoP"
  label: "Order Count period-over-period % change"
  type: number
  sql: CASE WHEN ${current_period_order_count} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_order_count} / NULLIF(${previous_period_order_count} ,0)) - 1 END ;;
  value_format_name: percent_2
}
measure: order_count_yoy_change {
  view_label: "_PoP"
  label: "Order Count period-over-period % change"
  type: number
  sql: CASE WHEN ${current_period_order_count} = 0
            THEN NULL
            ELSE (1.0 * ${current_period_order_count} / NULLIF(${same_period_last_year_order_count} ,0)) - 1 END ;;
  value_format_name: percent_2
}

# Refund Metrics
measure: current_period_sum_of_refund_amount {
  view_label: "_PoP"
  value_format: "$#,##0.00"
  type: sum
  sql: ${TABLE}.sum_of_refund_amount;;
  filters: {
    field: period_filtered_measures
    value: "this"
  }
}

measure: previous_period_sum_of_refund_amount {
  view_label: "_PoP"
  value_format: "$#,##0.00"
  type: sum
  sql: ${TABLE}.sum_of_refund_amount;;
  filters: {
    field: period_filtered_measures
    value: "last"
  }
}
measure: same_period_last_year_sum_of_refund_amount {
  view_label: "_PoP"
  value_format: "$#,##0.00"
  type: sum
  sql: ${TABLE}.sum_of_refund_amount;;
  filters: {
    field: period_filtered_measures
    value: "last year"
  }
}
measure: sum_of_refund_amount_pop_change {
  view_label: "_PoP"
  label: "Refund period-over-period % change"
  type: number
  sql: CASE WHEN ${current_period_sum_of_refund_amount} = 0
          THEN NULL
          ELSE (1.0 * ${current_period_sum_of_refund_amount} / NULLIF(${previous_period_sum_of_refund_amount} ,0)) - 1 END ;;
  value_format_name: percent_2
}
measure: sum_of_refund_amount_yoy_change {
  view_label: "_PoP"
  label: "Refund period-over-period % change"
  type: number
  sql: CASE WHEN ${current_period_sum_of_refund_amount} = 0
          THEN NULL
          ELSE (1.0 * ${current_period_sum_of_refund_amount} / NULLIF(${same_period_last_year_sum_of_refund_amount} ,0)) - 1 END ;;
  value_format_name: percent_2
}
measure: current_period_sum_of_total_prices {
  view_label: "_PoP"
  value_format: "$#,##0.00"
  type: sum
  sql: ${TABLE}.sum_of_total_price;;
  filters: {
    field: period_filtered_measures
    value: "this"
  }
}
}
