view: daily_refund {
  derived_table: {
    explore_source: transaction {
      column: vu_date_string {}
      column: date_simple {}
      column: order_distinct_count {}
      column: sum_of_amount {}
      filters: {
        field: transaction.status
        value: "success"
      }
      filters: {
        field: transaction.kind
        value: "refund"
      }
    }
  }
  dimension: vu_date_string {
    primary_key: yes
  }
  dimension: date_simple {
    type: date
  }
  measure: order_distinct_count {
    value_format: "0"
    type: sum
    sql: ${TABLE}.order_distinct_count ;;
  }
  measure: sum_of_refund_amount {
    value_format: "$###,###.00"
    type: sum
    sql: ${TABLE}.sum_of_amount ;;
  }
}
