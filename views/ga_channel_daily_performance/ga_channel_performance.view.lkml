view: ga_channel_performance {
  sql_table_name: `aerobic-datum-283623.ga_au.ga_channel_performance_au`
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

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: channel_grouping {
    type: string
    sql: ${TABLE}.channel_grouping ;;
  }
  dimension: channel_type {
    type: string
    sql: CASE WHEN channel_grouping in
            ('(Other)','Direct','Back in Stock','Ettitude Blog','Klaviyo Email','Organic Search','Friendbuy','Other Social','SMS','Referral')
            THEN "non-paid" ELSE "paid" END;;
  }
  dimension: major_channel {
    type: yesno
    sql: CASE WHEN channel_grouping in
            ('Direct','Klaviyo Email','Organic Search','Affiliates','Google Shopping','Paid Search','Paid Social','Referral')
            THEN true ELSE false END;;
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

  dimension: new_users {
    type: number
    sql: ${TABLE}.new_users ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: profile {
    type: string
    hidden: yes
    sql: ${TABLE}.profile ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: transaction_revenue {
    type: number
    sql: ${TABLE}.transaction_revenue ;;
  }

  dimension: transactions {
    type: number
    sql: ${TABLE}.transactions ;;
  }

  dimension: unique_pageviews {
    type: number
    sql: ${TABLE}.unique_pageviews ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql:  FORMAT_DATE("%Y%m%d", ${TABLE}.date)  ;;
  }
  measure: count_of_paid_orders {
    type: sum
    sql: ${TABLE}.transactions;;
    filters: {
      field: channel_type
      value: "paid"
    }
  }
  measure: count_of_non_paid_orders {
    type: sum
    sql: ${TABLE}.transactions;;
    filters: {
      field: channel_type
      value: "non_paid"
    }
  }
  measure: revenue {
    type: sum
    sql: ${TABLE}.transaction_revenue ;;
  }
  measure: transaction {
    type: sum
    sql: ${TABLE}.transactions ;;
  }
  measure: sum_of_sessions {
    type: sum
    sql: ${TABLE}.sessions ;;
  }
}
