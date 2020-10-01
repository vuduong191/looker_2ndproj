view: customer {
  sql_table_name: `aerobic-datum-283623.shopify_au.customer`
    ;;
  drill_fields: [id, created_date]

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: accepts_marketing {
    type: yesno
    sql: ${TABLE}.accepts_marketing ;;
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: default_address_id {
    hidden: yes
    type: number
    sql: ${TABLE}.default_address_id ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: orders_count {
    type: number
    value_format_name: "decimal_0"
    sql: ${TABLE}.orders_count ;;
  }

  dimension: is_returning_customer {
    label: "Is Return Customer"
    description: "Indicates if the customer had more than 1 order."
    type: yesno
    sql: ${orders_count} > 1 ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: tax_exempt {
    type: yesno
    sql: ${TABLE}.tax_exempt ;;
  }

  dimension: total_spent {
    type: number
    sql: ${TABLE}.total_spent ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: verified_email {
    type: yesno
    sql: ${TABLE}.verified_email ;;
  }

  measure: count {
    label: "Number of Customers"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, last_name, first_name]
    filters: [id: "NOT NULL"]
  }
  measure: sum_of_total_spent {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    value_format_name: "usd"
    sql: ${total_spent} ;;
    drill_fields: [id, last_name, first_name]
  }
  measure: sum_of_total_spent_acceptemail {
    type: sum
    filters: [accepts_marketing: "Yes"]
    value_format_name: "usd"
    sql: ${total_spent} ;;
    drill_fields: [id, last_name, first_name]
  }
  measure: prc_acc {
    type: number
    value_format_name: "percent_0"
    description: "The percent of customers who accept mail."
    sql: ${sum_of_total_spent_acceptemail}/NULLIF(${sum_of_total_spent},0) ;;
    drill_fields: [id, last_name, first_name]
  }

  measure: returning_count {
    label: "Number of Returning Customers"
    description: "The number of returning customers."
    type: count
    filters: [id: "NOT NULL", is_returning_customer: "Yes"]
    hidden: yes
  }

  measure: percent_returning {
    type: number
    description: "The percentage of returning customers"
    value_format_name: percent_1
    sql: ${returning_count}/nullif(${count},0) ;;
  }

  measure: average_actual_ltv {
    type: number
    label: "Average Actual LTV"
    description: "The average lifetime value of customers, based on actual past orders"
    sql: ${sum_of_total_spent}/${count} ;;
    value_format_name: usd
  }
}
