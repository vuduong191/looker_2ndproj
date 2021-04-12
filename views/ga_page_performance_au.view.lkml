view: ga_page_performance_au {
  sql_table_name: `aerobic-datum-283623.ga_au.ga_page_performance_au`
    ;;
# wrong table name, will update later
  dimension: _fivetran_id {
    type: string
    hidden: yes
    sql: ${TABLE}._fivetran_id ;;
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

  dimension: bounces {
    type: number
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
  dimension: entrances {
    hidden: yes
    type: number
    sql: ${TABLE}.entrances ;;
  }

  dimension: exits {
    hidden: yes
    type: number
    sql: ${TABLE}.exits ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }
  dimension: pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: profile {
    hidden: yes
    type: string
    sql: ${TABLE}.profile ;;
  }

  dimension: time_on_page {
    hidden: yes
    type: number
    sql: ${TABLE}.time_on_page ;;
  }

  dimension: unique_pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }
  measure: total_unique_pageviews {
    type: sum
    sql: ${unique_pageviews} ;;
  }
  measure: total_time_on_page {
    type: sum
    sql: ${time_on_page} ;;
  }

  measure: total_bounces {
    type: sum
    sql: ${bounces} ;;
  }

  measure: total_pageviews {
    type: sum
    sql: ${pageviews} ;;
  }
  measure: total_exit {
    type: sum
    sql: ${exits} ;;
  }
  measure: total_entrances {
    type: sum
    sql: ${entrances} ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
