view: order_tag {
  sql_table_name: `aerobic-datum-283623.shopify_au.order_tag`
    ;;

  dimension: pk {
    type: number
    hidden: yes
    primary_key: yes
    sql: ${pk2_order_id} * 100 + ${pk2_index} ;;
  }
  dimension: pk2_index {
    hidden: yes
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: pk2_order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: value {
    label: "Order Tag Value"
    type: string
#     hidden: yes
    sql: ${TABLE}.value ;;
  }

  dimension: marketing_tag_integer {
    type: number
    hidden: yes
    sql: CASE WHEN lower(value) in
            ('samples','b2b Sample','media sample','photoshoot sample','partnership','giveaway','influence','investor')
            THEN 1 ELSE 0 END;;
  }
  dimension: excludefromreport {
    type: number
    # hidden: yes
    sql: if ( lower(value) LIKE 'or %'
      OR value = 'EXCLUDEFROMREPORT', 1, 0);;
  }

  dimension: b2b_tag_integer {
    type: number
    sql: if ( lower(value) LIKE '%b2b%'
        OR lower(value) LIKE '%wholesale%'
        OR lower(value) LIKE '%warehouse%'
        OR lower(value) LIKE '%made trade%'
        OR lower(value) LIKE '%ourcommonplace%'
        OR lower(value) LIKE '%carro%'
        OR lower(value) LIKE '%bespoke%'
        OR lower(value) LIKE '%donegood%'
        OR lower(value) LIKE '%dropship%', 1, 0);;
#     hidden: yes
#     sql: CASE WHEN lower(value) LIKE '%b2b%'
#       THEN 1 ELSE 0 END;;
  }
  measure: sum_marketing_tag_integer {
    type: sum
    hidden: yes
    sql: ${marketing_tag_integer} ;;
  }
  measure: sum_excludefromreport_tag_integer {
    type: sum
    hidden: yes
    sql: ${excludefromreport} ;;
  }
  measure: sum_b2b_tag_integer {
    type: sum
#     hidden: yes
    sql: ${b2b_tag_integer} ;;
  }
}
