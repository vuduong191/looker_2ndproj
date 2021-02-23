view: order_is_b2b {
  derived_table: {
    explore_source: order_tag {
      column: sum_b2b_tag_integer {}
      column: pk2_order_id {}
    }
  }
  dimension: id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.pk2_order_id ;;
  }
  dimension: sum_b2b_tag_integer {
    label: "Order Line Sum B2B Tag Integer"
    type: number
    hidden: yes
  }

  dimension: is_b2b {
    description: "Indicates if the order is a marketing order"
    type: yesno
    sql: ${sum_b2b_tag_integer}>0 ;;
  }
}
