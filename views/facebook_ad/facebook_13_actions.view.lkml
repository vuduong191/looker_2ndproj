view: facebook_13_actions {
  sql_table_name: `aerobic-datum-283623.facebook_13.facebook_13_actions`
    ;;

  dimension: _1_d_view {
    type: number
    sql: ${TABLE}._1_d_view ;;
  }

  dimension: _7_d_click {
    type: number
    sql: ${TABLE}._7_d_click ;;
  }

  dimension: action_type {
    type: string
    sql: ${TABLE}.action_type ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
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

  dimension: index {
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  measure: sum_of_value{
    type: sum
    sql: ${value} ;;
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql:  FORMAT_DATE("%Y%m%d", ${TABLE}.date)  ;;
  }
}
