
view: klaviyo_placed_order {
  derived_table: {
    sql:
      SELECT order_id,order_Value, campaign,flow,order_time,customer_id
      FROM
      (
        SELECT order_id, order_Value, campaign,flow, event_type,order_time, customer_id, ROW_NUMBER() OVER (partition by order_id ORDER BY order_time desc) as row_num
        FROM
        (
          SELECT p1.property_event_id as order_id, p1.property_value as order_value, p1.datetime as order_time,p1.person_id as customer_id,  p2.campaign_id as campaign,p2.flow_id as flow, p2.type as event_type, p2.datetime as event_time
          FROM `aerobic-datum-283623.klaviyo_au.event` p1
          LEFT JOIN `aerobic-datum-283623.klaviyo_au.event` p2
          ON p1.person_id = p2.person_id AND (p2.type="Opened Email" or p2.type="Clicked Email")  and p1.datetime > p2.datetime and TIMESTAMP_ADD(p2.datetime , INTERVAL 3 DAY)>p1.datetime
          WHERE p2.id is not null and p1.type="Placed Order"
        )
      ) final_p
      where final_p.row_num = 1 ;;
    sql_trigger_value: SELECT EXTRACT(DATE FROM TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL -60 MINUTE) AT TIME ZONE "America/Los_Angeles") ;;
  }

  dimension_group: date_of_order {
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
    sql: ${TABLE}.order_time ;;
  }
  dimension: order_id {
    sql: ${TABLE}.order_id ;;
  }
  dimension: customer_id {
    sql: ${TABLE}.customer_id ;;
  }
  dimension: order_Value {
    sql: ${TABLE}.order_Value ;;
  }
  dimension: campaign {
    sql: ${TABLE}.campaign ;;
  }
  dimension: flow {
    sql: ${TABLE}.flow ;;
  }
  measure: count_of_order{
    type: count_distinct
    sql: ${TABLE}.order_id ;;
    drill_fields: [date_of_order_date,order_id,order_Value,customer_id]
  }
  measure: revenue {
    type: sum
    value_format: "#,##0.00"
    sql: ${TABLE}.order_Value ;;
    drill_fields: [date_of_order_date,order_id,order_Value,customer_id]
  }
}
