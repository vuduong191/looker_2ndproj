view: facebook_main_metrics {
  sql_table_name: `aerobic-datum-283623.facebook_2.facebook_main_metrics`
    ;;
# simple view with clicks, impressions, spend
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

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.account_name ;;
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
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql:  FORMAT_DATE("%Y%m%d", ${TABLE}.date)  ;;
  }
  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }

  measure: spend {
    value_format_name: "usd"
    type: sum
    sql: ${TABLE}.spend ;;
  }

}
