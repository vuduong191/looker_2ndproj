connection: "klaviyo"

# include all the views
include: "/views/**/*.view"
include: "/**/*.dashboard"

datagroup: test_vu_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}
datagroup: daily_datagroup {
  sql_trigger:   SELECT cast(CURRENT_DATE as string); ;;
  max_cache_age: "25 hours"
}

persist_with: test_vu_default_datagroup



explore: order {}
explore: order_line {
  join: order {
    type: left_outer
    relationship: many_to_one
    view_label: "Order"
    fields: [order.created_date, order.created_week, order.is_cancelled, order.source_name, sum_of_sales, id, name, count, min_order_id]
    sql_on: ${order.id}=${order_line.order_id} ;;
  }

  join: order_tag {
    view_label: "Order Line"
    type: left_outer
    relationship: one_to_many
    sql_on: ${order_line.order_id} = ${order_tag.pk2_order_id} ;;
    fields: [value, marketing_tag_integer, sum_marketing_tag_integer, sum_b2b_tag_integer]
  }
  join: order_is_marketing {
    view_label: "Order Line"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_line.id} = ${order_is_marketing.id} ;;
  }
  join: order_is_b2b {
    view_label: "Order Line"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_line.id} = ${order_is_b2b.id} ;;
  }
  join: product {
    view_label: "Order Line"
    relationship: many_to_one
    sql_on: ${order_line.product_id}=${product.id} ;;
  }
  join: vu_product_data_au {
    type: left_outer
    view_label: "Manual Data"
    relationship: many_to_one
    sql_on: ${order_line.sku}=${vu_product_data_au.product_variant_sku} ;;
  }
  join: inventory_week_active {
    relationship: many_to_one
    # sql_on: ${order.created_week} = ${inventory_week_active.snapshot_week}
    # AND ${order_line.sku} = ${inventory_week_active.sku};;
    # temp before inventory snapshot isready
    sql_on: ${order.created_week} = ${inventory_week_active.day_week}
    AND ${order_line.sku} = ${inventory_week_active.product_variant_sku};;
  }
  join: customer {
    relationship: many_to_one
    sql_on: ${customer.id} = ${order.customer_id} ;;
    fields: [id, count, first_name, last_name, created_date, created_month, tax_exempt, verified_email,
      state, orders_count, accepts_marketing, percent_returning, is_returning_customer, average_actual_ltv]
  }

# This view adds only one additional field; the first order date!
  join: customer_first_order {
    relationship: many_to_one
    sql_on: ${order.id} = ${customer_first_order.min_order_id} ;;
  }
# This view adds important dimensions like the number of days since the first order
  join: order_customer_dimensions {
    view_label: "Order"
    relationship: one_to_one
    sql:   ;;
  }
  join: first_order_product_types {
    relationship: many_to_one
    view_label: "Customer"
    sql_on: ${first_order_product_types.customer_id} = ${order.customer_id} ;;
  }
}

explore: inventory_level {
  hidden: yes
  join: product_variant {
    relationship: many_to_one
    sql_on: ${product_variant.inventory_item_id}=${inventory_level.inventory_item_id} ;;
  }
  join: product {
    relationship: many_to_one
    sql_on: ${product_variant.product_id} = ${product.id}  ;;
  }
}

explore: product_variant {
  join: vu_product_data_au {
    type: left_outer
    view_label: "Manual Data"
    relationship: many_to_one
    sql_on: ${product_variant.sku}=${vu_product_data_au.product_variant_sku} ;;
  }
  join: avg_weekly_sales_2 {
    type: left_outer
    relationship: many_to_one
    view_label: "L12W Data"
    sql_on: ${product_variant.sku}=${avg_weekly_sales_2.sku} ;;
  }
}
explore: inventory_insert {
  hidden: yes
}
explore: inventory_insert_native {
  hidden: yes
}
explore: inventory_snapshot {
  join: product_variant {
    relationship: many_to_one
    sql_on: ${inventory_snapshot.inventory_item_id} = ${product_variant.inventory_item_id} ;;
  }
  join: product {
    relationship: many_to_one
    sql_on: ${product_variant.product_id} = ${product.id} ;;
  }
}

explore: avg_weekly_sales_2 {}
explore: avg_weekly_sales_1 {
  join: avg_weekly_sales_2 {
    type: left_outer
    relationship: one_to_one
    sql_on: ${avg_weekly_sales_1.sku}=${avg_weekly_sales_2.sku} ;;
    fields: [avg_weekly_sales_2.rank_group_l12w]
    view_label: "L12W Data"
  }
}
explore: order_shipping_line {}
explore: order_tag {}
explore: order_is_b2b {}
explore: woh {}

# temporary before inventory snapshot ready
explore: daily_inventory_au {}
