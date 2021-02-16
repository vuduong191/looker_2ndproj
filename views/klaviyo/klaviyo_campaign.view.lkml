view: klaviyo_campaign {
  sql_table_name: `aerobic-datum-283623.klaviyo_au.campaign`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: campaign_type {
    type: string
    sql: ${TABLE}.campaign_type ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created ;;
  }

  dimension: email_template_id {
    type: string
    sql: ${TABLE}.email_template_id ;;
  }

  dimension: is_segmented {
    type: yesno
    sql: ${TABLE}.is_segmented ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: send {
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
    sql: ${TABLE}.send_time ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: status_id {
    type: string
    sql: ${TABLE}.status_id ;;
  }

  dimension: status_label {
    type: string
    sql: ${TABLE}.status_label ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

}
