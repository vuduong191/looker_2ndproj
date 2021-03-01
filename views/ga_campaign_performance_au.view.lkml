view: ga_campaign_performance_au {
  sql_table_name: `aerobic-datum-283623.google_analytics_au.ga_campaign_performance_au`
    ;;


  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
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

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: profile {
    type: string
    sql: ${TABLE}.profile ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: transaction_revenue {
    type: number
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: unique_pageviews {
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: first_date_shown {
    type: date
    sql: MIN(${date_date}) ;;
    convert_tz: no
  }
  measure: sum_of_unique_pageviews {
    type: sum
    sql: ${TABLE}.unique_pageviews ;;
  }
  measure: sum_of_users {
    type: sum
    sql: ${TABLE}.users ;;
  }
  measure: sum_of_transactions {
    type: sum
    sql: ${TABLE}.transactions ;;
  }
  measure: sum_of_transaction_revenue {
    type: sum
    value_format: "$#,##0.00"
    sql: ${TABLE}.transaction_revenue ;;
  }
  measure: sum_of_sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }
  measure: sum_of_session_duration {
    type: sum
    sql: ${TABLE}.session_duration ;;
  }
  measure: sum_of_pageviews {
    type: sum
    sql: ${TABLE}.pageviews ;;
  }
  measure: sum_of_new_users {
    type: sum
    sql: ${TABLE}.new_users ;;
  }
  measure: sum_of_bounces {
    type: sum
    sql: ${TABLE}.bounces ;;
  }
}
