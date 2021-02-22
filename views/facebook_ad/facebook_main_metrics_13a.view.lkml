view: facebook_main_metrics_13a {
  sql_table_name: `aerobic-datum-283623.facebook_13.facebook_13`
    ;;
# simple view with clicks, impressions, spend

    dimension: account_id {
      type: string
      sql: CAST(${TABLE}.account_id AS STRING) ;;
    }

    dimension: account_name {
      type: string
      sql: ${TABLE}.account_name ;;
    }
  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
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
