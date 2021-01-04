# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: order_summary {
  derived_table: {
    explore_source: order {
      column: sum_of_net_sales {}
      column: 445_year {field: calendar_convert_445._445_year }
      column: 445_quarter {field: calendar_convert_445._445_quarter }
      column: 445_month {field: calendar_convert_445._445_month }
      column: 445_week {field: calendar_convert_445._445_week }
      column: date_number_445_full {field:calendar_convert_445.date_number_445_full}
      column: current_date_number_445_start {field:calendar_convert_445.current_date_number_445_start}
      column: current_date_number_445_end {field:calendar_convert_445.current_date_number_445_end}
      column: sum_of_subtotal_price {}
      column: sum_of_total_discounts {}
      column: sum_of_total_line_items_price {}
      column: sum_of_total_price {}
      column: sum_of_total_tax {}
      column: count {}
      column: vu_date_string {}
      column: date_simple {}
      filters: {
        field: order.is_cancelled
        value: "No"
      }
      filters: {
        field: order.shipping_required
        value: "Yes"
      }
      filters: {
        field: order_is_marketing.is_marketing
        value: "No"
      }
      filters: {
        field: order_is_b2b.is_b2b
        value: "No"
      }
    }
  }
  measure: sum_of_net_sales {
    description: "tax excluded, shipping fee included"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sum_of_net_sales ;;
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
    sql: ${TABLE}.count ;;
  }
  dimension: vu_date_string {
    primary_key: yes
    hidden: yes
  }
  dimension: date_simple {
    description: "Date in Australia TZ"
    type: date
    convert_tz: no
  }

  filter: current_date_range {
    type: date
    view_label: "_PoP"
    convert_tz: no
    label: "1. Current Date Range"
    description: "Select the current date range you are interested in. Make sure any other filter on Event Date covers this period, or is removed."
    # sql: ${period} IS NOT NULL ;;
  }

  dimension: 445_year {}
  dimension: 445_month {}
  dimension: 445_quarter {}
  dimension: 445_week {}
  dimension: date_number_445_full {}
  dimension: current_date_number_445_start {
    type: number
  }
  dimension: current_date_number_445_end {
    type: number
  }
  measure: current_date_number_445_start_constant {
    hidden: yes
    type: min
    sql:
      CASE WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %}
      THEN ${TABLE}.date_number_445_full
      ELSE NULL
      END ;;
  }
  measure: current_date_number_445_end_constant {
    hidden: yes
    type: max
    sql:
      CASE WHEN {% condition current_date_range %} TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.date_simple, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %}
      THEN ${TABLE}.date_number_445_full
      ELSE NULL
      END ;;
  }

}
