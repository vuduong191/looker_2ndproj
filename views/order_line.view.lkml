view: order_line {
  sql_table_name: `aerobic-datum-283623.shopify_au.order_line`
    ;;
  drill_fields: [id, order.name, price, order_id]

  dimension: id {
    primary_key: yes
    type: number
#     hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: fulfillable_quantity {
    hidden: yes
    group_label: "Fullfillment"
    type: number
    sql: ${TABLE}.fulfillable_quantity ;;
  }

  dimension: fulfillment_service {
    hidden: yes
    group_label: "Fullfillment"
    type: string
    sql: ${TABLE}.fulfillment_service ;;
  }

  dimension: fulfillment_status {
    hidden: yes
    group_label: "Fullfillment"
    type: string
    sql: ${TABLE}.fulfillment_status ;;
  }

  dimension: gift_card {
    type: yesno
    sql: ${TABLE}.gift_card ;;
  }

  dimension: grams {
    hidden: yes
    type: number
    sql: ${TABLE}.grams ;;
  }

  dimension: index {
    description: "The line number within a cart."
    type: number
    sql: ${TABLE}.index ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    hidden: yes
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: pre_tax_price {
    description: "Price after markdown and before tax applied"
    type: number
    value_format_name: usd
    sql: ${TABLE}.pre_tax_price ;;
  }

  dimension: price {
    description: "Original price"
    type: number
    value_format_name: usd
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    hidden: yes
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: property_bundle_id {
    group_label: "Properties"
    type: string
    hidden: yes
    sql: ${TABLE}.property_bundle_id ;;
  }

  # dimension: property_bundle_image {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_bundle_image ;;
  # }

  # dimension: property_bundle_url {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_bundle_url ;;
  # }

  # dimension: property_complete_bundle {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_complete_bundle ;;
  # }

  # dimension: property_discount {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_discount ;;
  # }

  # dimension: property_discount_bundle {
  #   group_label: "Properties"
  #   type: yesno
  #   sql: ${TABLE}.property_discount_bundle ;;
  # }

  # dimension: property_discount_name {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_discount_name ;;
  # }

  # dimension: property_discount_type {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_discount_type ;;
  # }

  # dimension: property_from_wishlist {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_from_wishlist ;;
  # }

  # dimension: property_pos_code_key_for_gift_card_creation {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_pos_code_key_for_gift_card_creation ;;
  # }

  # dimension: property_pre_ordered_items {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_pre_ordered_items ;;
  # }

  # dimension: property_products {
  #   group_label: "Properties"
  #   type: string
  #   sql: ${TABLE}.property_products ;;
  # }

  # dimension: property_shipping_from_august_10_th {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_shipping_from_august_10_th ;;
  # }

  # dimension: property_shipping_from_july_20_th {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_shipping_from_july_20_th ;;
  # }

  # dimension: property_shipping_from_july_31_st {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_shipping_from_july_31_st ;;
  # }

  # dimension: property_ships_from_august_10_th {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_ships_from_august_10_th ;;
  # }

  # dimension: property_ships_from_august_25_th {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_ships_from_august_25_th ;;
  # }

  # dimension: property_ships_from_july_20_th {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_ships_from_july_20_th ;;
  # }

  # dimension: property_ships_from_july_31_st {
  #   group_label: "Properties"
  #   type: number
  #   sql: ${TABLE}.property_ships_from_july_31_st ;;
  # }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: requires_shipping {
    hidden: yes
    type: yesno
    sql: ${TABLE}.requires_shipping ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}.sku ;;
  }

  dimension: taxable {
    type: yesno
    sql: ${TABLE}.taxable ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: total_discount {
    type: number
    sql: ${TABLE}.total_discount ;;
    value_format_name: usd
  }

  dimension: variant_id {
    type: number
    hidden: yes
    sql: ${TABLE}.variant_id ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  measure: count {
    label: "Number of Line Items"
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, name]
    filters: [id: "NOT NULL"]
  }
  measure: sum {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Total Unit Sold"
    value_format_name: decimal_0
    sql: ${quantity} ;;
  }
  measure: total_price {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    value_format_name: usd
    sql: ${price}*${quantity} ;;
  }
  measure: total_pre_tax_price {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    value_format_name: usd
    sql: ${pre_tax_price}*${quantity} ;;
  }
  measure: discount_total {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    description: "Total discount"
    value_format_name: decimal_2
    sql: ${total_discount} ;;
  }
  measure: markdown_total {
    type: number
    description: "Original price - Price before tax"
    value_format_name: decimal_2
    sql: ${total_price}-${total_pre_tax_price};;
  }
}
