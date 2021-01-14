view: inventory_snapshot_au {
  sql_table_name: `aerobic-datum-283623.looker_scratch.inventory_snapshot_au`
    ;;

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.day ;;
  }
  dimension: inventory_quantity {
    type: number
    sql: ${TABLE}.inventory_quantity ;;
  }
  dimension: pk {
    # hidden: yes
    primary_key: yes
    sql: ${sku} || ${day_date} ;;
  }
  dimension: sku {
    type: string
    sql: ${TABLE}.product_variant_sku ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: count_of_active_item_days {
    type: count
    filters: [inventory_quantity: ">0"]
  }
  measure: count_of_inactive_item_days {
    type: count
    filters: [inventory_quantity: "<=0"]
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql: FORMAT_DATETIME("%Y%m%d", ${day_date})  ;;
  }

  # measure: inventory_on_last_day_in_period{
  #   type: max
  #   filters: {
  #     field: day_date
  #     value: last_day_in_period
  #   }
  # }
}
