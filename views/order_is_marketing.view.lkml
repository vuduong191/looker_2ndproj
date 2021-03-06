view: order_is_marketing {
  derived_table: {
    explore_source: order_tag {
      column: sum_marketing_tag_integer {}
      column: pk2_order_id {}
    }
  }
  dimension: id {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.pk2_order_id ;;
  }
  dimension: sum_marketing_tag_integer {
    label: "Order Line Sum Marketing Tag Integer"
    type: number
    hidden: yes
  }

  dimension: is_marketing {
    description: "Indicates if the order is a marketing order"
    type: yesno
    sql: ${sum_marketing_tag_integer}>0 ;;
  }
}
