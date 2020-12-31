view: transaction {
  sql_table_name: `aerobic-datum-283623.shopify_au.transaction`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: _fivetran_synced {
    hidden: yes
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

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  dimension: authorization {
    hidden: yes
    type: string
    sql: ${TABLE}.authorization ;;
  }

  dimension_group: created {
    # hidden: yes
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
    sql: ${TABLE}.created_at ;;
  }
  dimension: vu_date_string {
    type: string
    sql: FORMAT_DATETIME("%Y%m%d", DATETIME(${TABLE}.created_at, "Australia/Melbourne"))  ;;
  }
  dimension: date_simple {
    type: date
    convert_tz: no
    sql: DATE(${TABLE}.created_at, "Australia/Melbourne") ;;
  }
  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: currency_exchange_adjustment {
    hidden: yes
    type: number
    sql: ${TABLE}.currency_exchange_adjustment ;;
  }

  dimension: currency_exchange_currency {
    hidden: yes
    type: string
    sql: ${TABLE}.currency_exchange_currency ;;
  }

  dimension: currency_exchange_final_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.currency_exchange_final_amount ;;
  }

  dimension: currency_exchange_id {
    hidden: yes
    type: number
    sql: ${TABLE}.currency_exchange_id ;;
  }

  dimension: currency_exchange_original_amount {
    hidden: yes
    type: number
    sql: ${TABLE}.currency_exchange_original_amount ;;
  }

  dimension: device_id {
    hidden: yes
    type: string
    sql: ${TABLE}.device_id ;;
  }

  dimension: error_code {
    hidden: yes
    type: string
    sql: ${TABLE}.error_code ;;
  }

  dimension: gateway {
    type: string
    sql: ${TABLE}.gateway ;;
  }

  dimension: kind {
    type: string
    sql: ${TABLE}.kind ;;
  }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: message {
    type: string
    sql: ${TABLE}.message ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: payment_avs_result_code {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_avs_result_code ;;
  }

  dimension: payment_credit_card_bin {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_credit_card_bin ;;
  }

  dimension: payment_credit_card_company {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_credit_card_company ;;
  }

  dimension: payment_credit_card_number {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_credit_card_number ;;
  }

  dimension: payment_cvv_result_code {
    hidden: yes
    type: string
    sql: ${TABLE}.payment_cvv_result_code ;;
  }

  dimension_group: processed {
    hidden: yes
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension: receipt {
    hidden: yes
    type: string
    sql: ${TABLE}.receipt ;;
  }

  dimension: refund_id {
    type: number
    sql: ${TABLE}.refund_id ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    hidden: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, source_name]
  }
  measure: order_distinct_count {
    type: count_distinct
    sql: ${TABLE}.order_id ;;
  }
  measure: sum_of_amount {
    type: sum
    sql: ${amount} ;;
  }
}
