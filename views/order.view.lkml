view: order {
  sql_table_name: `aerobic-datum-283623.shopify_au.order`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: billing_address_address_1 {
    group_label: "Billing Address"
    hidden: yes
    type: string
    sql: ${TABLE}.billing_address_address_1 ;;
  }

  dimension: billing_address_address_2 {
    group_label: "Billing Address"
    hidden: yes
    type: string
    sql: ${TABLE}.billing_address_address_2 ;;
  }

  dimension: billing_address_city {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_city ;;
  }

  dimension: billing_address_company {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_company ;;
  }

  dimension: billing_address_country {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_country ;;
  }

  dimension: billing_address_country_code {
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_country_code ;;
  }

  dimension: billing_address_first_name {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_first_name ;;
  }

  dimension: billing_address_last_name {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_last_name ;;
  }

  dimension: billing_address_latitude {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_latitude ;;
  }

  dimension: billing_address_longitude {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_longitude ;;
  }

  dimension: billing_address_name {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_name ;;
  }

  dimension: billing_address_phone {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_phone ;;
  }

  dimension: billing_address_province {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_province ;;
  }

  dimension: billing_address_province_code {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_province_code ;;
  }

  dimension: billing_address_zip {
    hidden: yes
    type: string
    group_label: "Billing Address"
    sql: ${TABLE}.billing_address_zip ;;
  }

  dimension: browser_ip {
    hidden: yes
    type: string
    sql: ${TABLE}.browser_ip ;;
  }

  dimension: buyer_accepts_marketing {
    type: yesno
    sql: ${TABLE}.buyer_accepts_marketing ;;
  }

  dimension: cancel_reason {
    group_label: "Status"
    type: string
    sql: ${TABLE}.cancel_reason ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
    hidden: yes
  }

  dimension: is_cancelled {
    view_label: "Order Validity Check"
    type: yesno
    sql: ${cancelled_raw} IS NOT NULL ;;
  }

  dimension: cart_token {
    type: string
    hidden: yes
    sql: ${TABLE}.cart_token ;;
  }

  dimension: checkout_token {
    hidden: yes
    type: string
    sql: ${TABLE}.checkout_token ;;
  }

  dimension_group: closed {
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
    sql: ${TABLE}.closed_at ;;
    hidden: yes
  }
  filter: date_time_to_filter_us_tz {
    type: date
    sql: {% condition date_time_to_filter_us_tz %} TIMESTAMP(FORMAT_DATETIME("%F %X", DATETIME(${TABLE}.created_at, '@{timezone_string}')), "America/Los_Angeles") {% endcondition %};;
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    type: string
    sql: FORMAT_DATETIME("%Y%m%d", DATETIME(${TABLE}.created_at, '@{timezone_string}'))  ;;
  }
  dimension: date_simple {
    type: date
    convert_tz: no
    sql: DATE(${TABLE}.created_at, '@{timezone_string}') ;;
  }
  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.created_at ;;
  }
  dimension_group: created_autz {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      week_of_year,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: TIMESTAMP(FORMAT_DATETIME("%F", DATE(${TABLE}.created_at, '@{timezone_string}'))) ;;
  }
  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Year" }
    default_value: "Date"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
      WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(DATE_TRUNC(DATE(${TABLE}.created_at, '@{timezone_string}'), DAY) AS STRING)
      WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(DATE_TRUNC(DATE(${TABLE}.created_at, '@{timezone_string}'), WEEK) AS STRING)
      WHEN {% parameter timeframe_picker %} = 'Month' THEN CAST(DATE_TRUNC(DATE(${TABLE}.created_at, '@{timezone_string}'), MONTH) AS STRING)
      WHEN {% parameter timeframe_picker %} = 'Year' THEN CAST(DATE_TRUNC(DATE(${TABLE}.created_at, '@{timezone_string}'), YEAR) AS STRING)
    END ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
    hidden: yes
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: financial_status {
    group_label: "Status"
    type: string
    sql: ${TABLE}.financial_status ;;
  }

  dimension: fulfillment_status {
    group_label: "Status"
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: landing_site_base_url {
    type: string
    hidden: yes
    sql: ${TABLE}.landing_site_base_url ;;
  }

  dimension: location_id {
    hidden: yes
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "View Shopify Order"
      url: "https://ettitude.myshopify.com/admin/orders/{{ id._value | url_encode }}?orderListBeta=true"
    }
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: number {
    type: number
    hidden: yes
    sql: ${TABLE}.number ;;
  }

  dimension: order_number {
    type: number
    sql: ${TABLE}.order_number ;;
  }

  dimension_group: processed {
    hidden: yes
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension: processing_method {
    type: string
    sql: ${TABLE}.processing_method ;;
  }

  dimension: referring_site {
    hidden: yes
    type: string
    sql: ${TABLE}.referring_site ;;
  }

  dimension: shipping_address_address_1 {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_address_1 ;;
  }

  dimension: shipping_address_address_2 {
    hidden: yes
    label: "Shipping Address"type: string
    sql: ${TABLE}.shipping_address_address_2 ;;
  }

  dimension: shipping_address_city {
    type: string
    label: "Shipping Address City"
    sql: ${TABLE}.shipping_address_city ;;
  }

  dimension: shipping_address_company {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_company ;;
  }

  dimension: shipping_address_country {
    label: "Shipping Address Country"
    type: string
    sql: ${TABLE}.shipping_address_country ;;
  }

  dimension: shipping_address_country_code {
    label: "Shipping Address"
    hidden: yes
    type: string
    sql: ${TABLE}.shipping_address_country_code ;;
  }

  dimension: shipping_address_first_name {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_first_name ;;
  }

  dimension: shipping_address_last_name {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_last_name ;;
  }

  dimension: shipping_address_latitude {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_latitude ;;
  }

  dimension: shipping_address_longitude {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_longitude ;;
  }

  dimension: shipping_address_name {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_name ;;
  }

  dimension: shipping_address_phone {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_phone ;;
  }

  dimension: shipping_address_province {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province ;;
  }

  dimension: shipping_address_province_code {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_province_code ;;
  }

  dimension: shipping_address_zip {
    hidden: yes
    label: "Shipping Address"
    type: string
    sql: ${TABLE}.shipping_address_zip ;;
  }

  dimension: source_name {
    type: string
    sql: ${TABLE}.source_name ;;
  }
  dimension: online_order {
    type: yesno
    sql: ${TABLE}.source_name="web" OR ${TABLE}.source_name="580111";;
  }
  dimension: subtotal_price {
    type: number
    sql: ${TABLE}.subtotal_price ;;
  }

  dimension: taxes_included {
    type: yesno
    sql: ${TABLE}.taxes_included ;;
  }

  dimension: test {
    hidden: yes
    type: yesno
    sql: ${TABLE}.test ;;
  }

  dimension: token {
    hidden: yes
    type: string
    sql: ${TABLE}.token ;;
  }

  dimension: total_discounts {
    type: number
    sql: ${TABLE}.total_discounts ;;
  }

  dimension: total_line_items_price {
    type: number
    sql: ${TABLE}.total_line_items_price ;;
  }

  dimension: total_price {
    type: number
    sql: ${TABLE}.total_price ;;
  }

  dimension: total_tax {
    type: number
    sql: ${TABLE}.total_tax ;;
  }

  dimension: total_weight {
    hidden: yes
    type: number
    sql: ${TABLE}.total_weight ;;
  }

  dimension_group: updated {
    hidden: yes
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: min_order_id {
    type: min
    hidden: yes
    sql: ${id} ;;
  }

  measure: count {
    label: "Number of Orders"
    type: count
    drill_fields: [detail*]
  }
  measure: sum_of_total_price {
    description: "Subtotal Price + Shipping + Tax (if tax is not included)"
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${total_price} ;;
  }

  measure: sum_of_total_line_items_price {
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${total_line_items_price} ;;
  }

  measure: sum_of_total_tax {
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${total_tax} ;;
  }

  measure: sum_of_subtotal_price {
    description: "Sum(Line item prices) - Discount"
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${subtotal_price} ;;
  }
  measure: sum_of_total_discounts {
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${total_discounts} ;;
  }
  dimension: net_sales {
    description: "Net sales (tax excluded, shipping fee included, after discount)"
    sql: ${total_price}-${total_tax};;
  }
  dimension: gross_sales {
    description: "Gross sales (tax excluded, shipping fee included, before discount)"
    sql: ${total_price}-${total_tax}+${total_discounts};;
  }

  measure: sum_of_net_sales {
    description: "tax excluded, shipping fee included"
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${net_sales} ;;
  }
  measure: sum_of_gross_sales {
    description: "tax excluded, shipping fee included"
    type: sum
    drill_fields: [detail*]
    value_format_name: "usd"
    sql: ${gross_sales} ;;
  }


  dimension: shipping_required {
    view_label: "Order Validity Check"
    type: yesno
    sql: ${TABLE}.shipping_address_country IS NOT NULL;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      created_date,
      name,
      source_name,
    ]
  }
}
