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
  dimension: order_distinct_count {
    type: number
  }
  dimension: sum_of_refund_amount {
    value_format: "$###,###.00"
    type: number
    sql: ${TABLE}.sum_of_amount ;;
  }
}
