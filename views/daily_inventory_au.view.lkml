view: daily_inventory_au {
  sql_table_name: `aerobic-datum-283623.daily_inventory_au.daily_inventory_au`
    ;;

  dimension: _file {
    type: string
    hidden: yes
    sql: ${TABLE}._file ;;
  }
  dimension: pk {
    hidden: yes
    sql: ${product_variant_sku} || ${day_date} ;;
  }

  dimension_group: _fivetran_synced {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: _line {
    type: number
    hidden: yes
    sql: ${TABLE}._line ;;
  }

  dimension_group: day {
    type: time
    timeframes: [
      raw,
      time,
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

  dimension: product_variant_sku {
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
}
