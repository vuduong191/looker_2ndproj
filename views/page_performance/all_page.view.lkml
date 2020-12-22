view: all_page {
  derived_table: {
    explore_source: ga_main_kpi_by_device_date_au {
      column: date_pk {}
      column: device_category {}
      column: total_bounces {}
      column: total_new_users {}
      column: total_pageviews {}
      column: total_session_duration {}
      column: total_sessions {}
      column: total_transaction_revenue {}
      column: total_transactions {}
      column: total_unique_pageviews {}
      column: total_users {}
    }
  }
  dimension: date_pk {
    convert_tz: no
    type: date
  }
  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: ${device_category} || ${date_pk} ;;
  }
  dimension: device_category {}
  measure: total_bounces {
    type: sum
    sql: ${TABLE}.total_bounces ;;
  }
  measure: total_new_users {
    type: sum
    sql: ${TABLE}.total_new_users ;;
  }
  measure: total_pageviews {
    type: sum
    sql: ${TABLE}.total_pageviews ;;
  }
  measure: total_session_duration {
    type: sum
    sql: ${TABLE}.total_session_duration ;;
  }
  measure: total_sessions {
    type: sum
    sql: ${TABLE}.total_sessions ;;
  }
  measure: total_transaction_revenue {
    type: sum
    sql: ${TABLE}.total_transaction_revenue ;;
  }
  measure: total_transactions {
    type: sum
    sql: ${TABLE}.total_transactions ;;
  }
  measure: total_unique_pageviews {
    type: sum
    sql: ${TABLE}.total_unique_pageviews ;;
  }
  measure: total_users {
    type: sum
    sql: ${TABLE}.total_users ;;
  }
  dimension_group: dt {
    convert_tz: no
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_pk ;;
  }
  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Year" }
    default_value: "Date"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${dt_date} AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(DATE_TRUNC(${dt_date}, WEEK) AS STRING)
    WHEN{% parameter timeframe_picker %} = 'Month' THEN CAST(DATE_TRUNC(${dt_date}, MONTH) AS STRING)
    WHEN{% parameter timeframe_picker %} = 'Year' THEN CAST(DATE_TRUNC(${dt_date}, YEAR) AS STRING)
    END ;;
  }
}
