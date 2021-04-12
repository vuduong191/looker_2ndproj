view: ga_ga_page_performance_channel {
  sql_table_name: `aerobic-datum-283623.ga_au.ga_ga_page_performance_channel_au`
    ;;



  dimension: channel_grouping {
    type: string
    sql: ${TABLE}.channel_grouping ;;
  }
  dimension: page_path {
    type: string
    sql: ${TABLE}.page_path ;;
  }
  dimension: date_pk {
    convert_tz: no
    datatype: date
    type: date
    primary_key: yes
    sql: ${TABLE}.date ;;
  }

  dimension: entrances {
    hidden: yes
    type: number
    sql: ${TABLE}.entrances ;;
  }
  measure: total_entrances {
    type: sum
    sql: ${entrances} ;;
  }

  dimension: bounces {
    hidden: yes
    type: number
    sql: ${TABLE}.bounces ;;
  }

  measure: total_bounces {
    type: sum
    sql: ${bounces} ;;
  }

  dimension: exits {
    hidden: yes
    type: number
    sql: ${TABLE}.exits ;;
  }
  measure: total_exits {
    type: sum
    sql: ${exits} ;;
  }


  dimension: page_value {
    hidden: yes
    type: number
    sql: ${TABLE}.page_value ;;
  }

  dimension: pageviews {
    hidden: yes
    type: number
    sql: ${TABLE}.pageviews ;;
  }
  measure: total_pageviews {
    type: sum
    sql: ${pageviews} ;;
  }
  dimension: time_on_page {
    hidden: yes
    type: number
    sql: ${TABLE}.time_on_page ;;
  }

  measure: total_time_on_page {
    type: sum
    sql: ${time_on_page} ;;
  }

  dimension: generated_revenue {
    hidden: yes
    type: number
    value_format: "0.##"
    sql: ${TABLE}.page_value*${TABLE}.unique_pageviews ;;
  }
  measure: total_generated_revenue {
    type: sum
    value_format: "0.##"
    sql: ${generated_revenue} ;;
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
  measure: count {
    type: count
    drill_fields: []
  }
}
