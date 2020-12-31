view: material_page {
  derived_table: {
    explore_source: page_performance_au {
      column: device_category {}
      column: total_entrances {}
      column: total_exit {}
      column: total_pageviews {}
      column: total_time_on_page {}
      column: total_bounces {}
      column: total_unique_pageviews {}
      column: date_pk {}
      filters: {
        field: page_performance_au.page_path
        value: "%our-fabrics%"
      }
    }
  }
  dimension: device_category {}
  set: set_details {
    fields: [date_pk, device_category,total_entrances, total_pageviews,total_exit]
  }
  dimension: pk {
    hidden: yes
    primary_key: yes
    sql: ${device_category} || ${date_pk} ;;
  }
  measure: total_entrances {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_entrances ;;
  }
  measure: total_exit {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_exit ;;
  }
  measure: total_pageviews {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_pageviews ;;
  }
  measure: total_time_on_page {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_time_on_page ;;
  }
  measure: total_unique_pageviews {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_unique_pageviews ;;
  }

  measure: total_bounces {
    type: sum
    drill_fields: [set_details*]
    sql: ${TABLE}.total_bounces ;;
  }

  dimension: date_pk {
    convert_tz: no
    type: date
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
