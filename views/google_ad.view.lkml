view: google_ad {
  sql_table_name: `aerobic-datum-283623.adwords_au.google_ads_au_pre_built_acc_stat`
    ;;

  dimension: _fivetran_id {
    type: string
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

  dimension: active_view_impressions {
    type: number
    sql: ${TABLE}.active_view_impressions ;;
  }

  dimension: active_view_measurability {
    type: number
    sql: ${TABLE}.active_view_measurability ;;
  }

  dimension: active_view_measurable_cost {
    type: number
    sql: ${TABLE}.active_view_measurable_cost ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }

  dimension: active_view_viewability {
    type: number
    sql: ${TABLE}.active_view_viewability ;;
  }

  dimension: ad_network_type_1 {
    type: string
    sql: ${TABLE}.ad_network_type_1 ;;
  }

  dimension: ad_network_type_2 {
    type: string
    sql: ${TABLE}.ad_network_type_2 ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversion_value {
    type: number
    sql: ${TABLE}.conversion_value ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
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

  dimension: device {
    type: string
    sql: ${TABLE}.device ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.external_customer_id ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}.interaction_types ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.slot ;;
  }

  dimension: view_through_conversions {
    type: number
    sql: ${TABLE}.view_through_conversions ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: total_of_cost {
    type: sum
    value_format: "$#,##0.00"
    sql: ${cost} ;;
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql:  FORMAT_DATE("%Y%m%d", ${TABLE}.date)  ;;
  }
}
