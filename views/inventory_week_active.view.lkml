view: inventory_week_active {
  # version with inventory snapshot
  # derived_table: {
  #   explore_source: inventory_snapshot {
  #     column: snapshot_week {}
  #     column: count {}
  #     column: count_of_active_item_days {}
  #     column: count_of_inactive_item_days {}
  #     column: sku {}
  #   }
  # }
  # dimension: pk {
  #   primary_key: yes
  #   hidden: yes
  #   sql: ${snapshot_week} || ${sku} ;;
  # }
  # dimension: snapshot_week {
  #   type: date_week
  # }
  # dimension: count {
  #   type: number
  # }
  # dimension: count_of_active_item_days {
  #   type: number
  # }
  # dimension: count_of_inactive_item_days {
  #   type: number
  # }
  # dimension: is_active {
  #   type: yesno
  #   sql: ${count_of_active_item_days} = 7 ;;
  # }
  # dimension: is_inactive {
  #   type: yesno
  #   sql: ${count_of_inactive_item_days} > 0 ;;
  # }
  # dimension: sku {}
  # }

  # Temporary version with uploaded data

derived_table: {
  explore_source: daily_inventory_au {
    column: day_week {}
    column: count {}
    column: count_of_active_item_days {}
    column: count_of_inactive_item_days {}
    column: product_variant_sku {}
  }
}
dimension: pk {
  primary_key: yes
  hidden: yes
  sql: ${day_week} || ${product_variant_sku} ;;
}
dimension: day_week {
  type: date_week
}
dimension: count {
  type: number
}
dimension: count_of_active_item_days {
  type: number
}
dimension: count_of_inactive_item_days {
  type: number
}
dimension: is_active {
  type: yesno
  sql: ${count_of_active_item_days} = 7 ;;
}
dimension: is_inactive {
  type: yesno
  sql: ${count_of_inactive_item_days} > 0 ;;
}
dimension: product_variant_sku {}
}
