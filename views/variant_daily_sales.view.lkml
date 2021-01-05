# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: variant_daily_sales {
  derived_table: {
    explore_source: order_line {
      column: _445_year {field: calendar_convert_445._445_year }
      column: _445_quarter {field: calendar_convert_445._445_quarter }
      column: _445_month {field: calendar_convert_445._445_month }
      column: _445_week {field: calendar_convert_445._445_week }
      column: order_name {field: order.name}
      column: date_number_445_full {field:calendar_convert_445.date_number_445_full}
      column: category { field: vu_product_data_au.category }
      column: color { field: vu_product_data_au.color }
      column: material { field: vu_product_data_au.material }
      column: product { field: vu_product_data_au.product }
      column: size { field: vu_product_data_au.size }
      column: vu_date_string { field: order.vu_date_string }
      column: total_pre_tax_price {}
      column: sum_of_quantity {}
      # column: order_count {}
      column: created_date { field: order.created_date }
      column: created_autz_date { field: order.created_autz_date }
      column: product_variant_sku { field: vu_product_data_au.product_variant_sku }
      filters: {
        field: order.online_order
        value: "Yes"
      }
      filters: {
        field: order.is_cancelled
        value: "No"
      }
      filters: {
        field: order_is_b2b.is_b2b
        value: "No"
      }
      filters: {
        field: order_is_marketing.is_marketing
        value: "No"
      }
    }
    persist_for: "24 hours"
  }
  dimension: category {
    label: "Category"
  }

  dimension: color {
    label: "Color"
  }
  dimension: material {
    label: "Material"
  }
  dimension: product {
    label: "Product"
  }
  dimension: size {
    label: "Size"
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
  dimension: created_date {
    convert_tz: no
    type: date
  }
  dimension: created_autz_date {
    convert_tz: no
    type: date
  }

  measure: total_pre_tax_price {
    value_format: "$#,##0.00"
    type: sum
    drill_fields: [detail*]
    sql: ${TABLE}.total_pre_tax_price ;;
  }
  measure: total_unit_sold {
    value_format: "#,##0"
    type: sum
    drill_fields: [detail*]
    sql:  ${TABLE}.sum_of_quantity;;
  }
  # measure: order_count {
  #   value_format: "#,##0"
  #   type: count_distinct
  #   drill_fields: [detail*]
  #   sql: ${TABLE}.order_name ;;
  # }
  dimension: product_variant_sku {
    label: "SKU"
  }
  filter: current_date_range {
    type: date
    view_label: "_PoP"
    convert_tz: no
    label: "1. Current Date Range"
    # sql: ${period} IS NOT NULL ;;
  }
  dimension: order_name {}
  dimension: _445_year {}
  dimension: _445_month {}
  dimension: _445_quarter {}
  dimension: _445_week {}
  dimension: date_number_445_full {}

  measure: current_date_number_445_start_constant {
    # hidden: yes
    type: min
    sql:
      CASE WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %}
      THEN ${TABLE}.date_number_445_full
      ELSE NULL
      END ;;
  }
  measure: current_date_number_445_end_constant {
    # hidden: yes
    type: max
    sql:
      CASE WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_autz_date, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %}
      THEN ${TABLE}.date_number_445_full
      ELSE NULL
      END ;;
  }

# ----- Sets of fields for drilling ------
    set: detail {
      fields: [
        product_variant_sku,
        created_autz_date,
        total_unit_sold,
        order_name
      ]
    }
}
