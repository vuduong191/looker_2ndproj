view: pinterest_advertiser_report {
  sql_table_name: `aerobic-datum-283623.pinterest_ads.advertiser_report`
    ;;

  dimension_group: _fivetran_synced {
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
    sql: ${TABLE}._fivetran_synced ;;
  }

  dimension: advertiser_id {
    type: string
    sql: ${TABLE}.advertiser_id ;;
  }


  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  measure: impression_1 {
    type: sum
    sql: ${TABLE}.impression_1 ;;
  }

  measure: impression_2 {
    type: sum
    sql: ${TABLE}.impression_2 ;;
  }
  measure: clickthrough_2 {
    type: sum
    sql: ${TABLE}.clickthrough_2 ;;
  }

  measure: clickthrough_1 {
    type: sum
    sql: ${TABLE}.clickthrough_1 ;;
  }

  measure: spend_in_micro_dollar {
    type: sum
    sql: ${TABLE}.spend_in_micro_dollar ;;
  }


  measure: total_click_checkout {
    type: sum
    sql: ${TABLE}.total_click_checkout ;;
  }

  measure: total_click_checkout_quantity {
    type: sum
    sql: ${TABLE}.total_click_checkout_quantity ;;
  }

  measure: total_click_checkout_value_in_micro_dollar {
    type: sum
    sql: ${TABLE}.total_click_checkout_value_in_micro_dollar ;;
  }
  measure: total_view_checkout {
    type: sum
    sql: ${TABLE}.total_view_checkout ;;
  }

  measure: total_view_checkout_quantity {
    type: sum
    sql: ${TABLE}.total_view_checkout_quantity ;;
  }

  measure: total_view_checkout_value_in_micro_dollar {
    type: sum
    sql: ${TABLE}.total_view_checkout_value_in_micro_dollar ;;
  }
  measure: total_checkouts {
    type: number
    sql: ${total_click_checkout}+${total_view_checkout} ;;
  }
  measure: total_clicks {
    type: number
    sql: ${clickthrough_1}+${clickthrough_2} ;;
  }
  measure: total_impressions {
    type: number
    sql: ${impression_1}+${impression_2} ;;
  }
  measure: total_revenue {
    value_format: "$###,###.00"
    type: number
    sql: ${total_click_checkout_value_in_micro_dollar}/1000000+${total_view_checkout_value_in_micro_dollar}/1000000 ;;
  }
  measure: total_spend {
    value_format: "$###,###.00"
    type: number
    sql: ${spend_in_micro_dollar}/1000000 ;;
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql: FORMAT_DATETIME("%Y%m%d", DATETIME(${TABLE}.date, '@{timezone_string}'))  ;;
  }
}
