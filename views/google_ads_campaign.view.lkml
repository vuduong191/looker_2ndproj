view: google_ads_campaign {
  sql_table_name: `aerobic-datum-283623.adwords_au.google_ads_au_campaign_list`
    ;;


  dimension: ad_network_type_1 {
    type: string
    sql: ${TABLE}.ad_network_type_1 ;;
  }

  dimension: ad_network_type_2 {
    type: string
    sql: ${TABLE}.ad_network_type_2 ;;
  }

  dimension: base_campaign_id {
    type: number
    sql: ${TABLE}.base_campaign_id ;;
  }

  dimension: campaign_group_id {
    type: number
    sql: ${TABLE}.campaign_group_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }
  dimension: custom_type {
    type: string
    sql: CASE WHEN lower(campaign_name) LIKE 'brand%' THEN "branded"
              WHEN lower(campaign_name) LIKE 'nonbrand%' THEN "nonbranded"
              WHEN lower(campaign_name) LIKE '%shopping%' THEN "shopping"
              WHEN lower(campaign_name) LIKE '%ggdisplay%' THEN "display"
              ELSE "undefined" END;;
  }
  dimension: campaign_status {
    type: string
    sql: ${TABLE}.campaign_status ;;
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
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql:  FORMAT_DATE("%Y%m%d", ${TABLE}.date)  ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
  }
  measure: sum_of_cost {
    value_format: "$#,##0.00"
    type: sum
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
    sql: ${TABLE}.cost ;;
  }
  measure: total_of_impressions {
    type: sum
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
    sql: ${TABLE}.impressions ;;
  }
  measure: total_of_conversions {
    type: sum
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
    sql: ${TABLE}.conversions ;;
  }
  measure: total_of_conversion_value {
    value_format: "$#,##0.00"
    type: sum
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
    sql: ${TABLE}.conversion_value ;;
  }
  measure: total_of_clicks {
    type: sum
    drill_fields: [campaign_name,sum_of_cost,total_of_clicks,total_of_conversion_value,total_of_conversions, total_of_impressions]
    sql: ${TABLE}.clicks ;;
  }
}
