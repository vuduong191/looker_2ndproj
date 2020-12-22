view: ga_main_kpi_by_device_date_au {
  sql_table_name: `aerobic-datum-283623.google_analytics_au.ga_main_kpi_by_device_date_au`
    ;;
  dimension: bounces {
    hidden: yes
    type: number
    sql: ${TABLE}.bounces ;;
  }

  measure: total_bounces {
    type: sum
    sql: ${TABLE}.bounces ;;
  }

  dimension: date_pk {
    convert_tz: no
    datatype: date
    type: date
    primary_key: yes
    sql: ${TABLE}.date ;;
  }
  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: new_users {
    hidden: yes
    type: number
    sql: ${TABLE}.new_users ;;
  }

  measure: total_new_users {
    type: sum
    sql: ${TABLE}.new_users ;;
  }

  dimension: pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  measure: total_pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }

  dimension: session_duration {
    hidden: yes
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  measure: total_session_duration {
    type: sum
    sql: ${TABLE}.session_duration ;;
  }

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  measure: total_sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }

  dimension: transaction_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.transaction_revenue ;;
  }

  measure: total_transaction_revenue {
    type: sum
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transactions {
    hidden: yes
    type: number
    sql: ${TABLE}.transactions ;;
  }

  measure: total_transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
  }

  dimension: unique_pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }

  measure: total_unique_pageviews {
    type: sum
    sql: ${TABLE}.unique_pageviews ;;
  }

  dimension: users {
    hidden: yes
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: total_users {
    type: sum
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }


}
