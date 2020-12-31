connection: "klaviyo"

# include all the views
include: "/views/**/*.view"
include: "/dashboards/*.dashboard"
week_start_day: sunday
datagroup: daily_datagroup {
  sql_trigger:   SELECT cast(CURRENT_DATE as string); ;;
  max_cache_age: "24 hours"
}

explore: order {
  join: order_tag {
    # view_label: "Order Validity Check"
    type: left_outer
    relationship: one_to_many
    sql_on: ${order.id} = ${order_tag.pk2_order_id} ;;
    fields: [value, marketing_tag_integer, sum_marketing_tag_integer, sum_b2b_tag_integer]
  }
  join: order_is_marketing {
    view_label: "Order Validity Check"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order.id} = ${order_is_marketing.id} ;;
  }
  join: order_is_b2b {
    view_label: "Order Validity Check"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order.id} = ${order_is_b2b.id} ;;
  }
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${order.vu_date_string} = ${calendar_convert_445.date_string} ;;
    fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}

explore: transaction {}
explore: order_line {
  join: order {
    type: left_outer
    relationship: many_to_one
    view_label: "Order"
    fields: [order.created_date, order.created_raw, order.created_week, order.is_cancelled, order.source_name,id, name, count, min_order_id, order.online_order, order.dynamic_timeframe, order.timeframe_picker]
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
    AND ${order_line.sku} = ${inventory_week_active.sku};;
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

explore: inventory_snapshot_au {}

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
explore: bundle_sales {}
# temporary before inventory snapshot ready

explore: affiliate_daily_performance_au {
  join: affiliate_performance_measures {
    view_label: "Calculated Metrics"
    relationship: one_to_one
    sql:   ;;
}
}
explore: page_performance_au {}
explore: page_performance_channel {}
explore: impact_page {
  join: all_page {
    relationship: many_to_one
    sql_on: ${impact_page.pk} = ${all_page.pk}  ;;
  }
}
explore: material_page {
  join: all_page {
    relationship: many_to_one
    sql_on: ${material_page.pk} = ${all_page.pk}  ;;
  }
}
explore: ga_main_kpi_by_device_date_au {}
explore: all_page {}
explore: order_summary {
  join: find_date_number {
    type: cross
    relationship: many_to_one
  }
  join: daily_refund {
    relationship: many_to_one
    sql_on: ${order_summary.vu_date_string} = ${daily_refund.vu_date_string} ;;
    fields: [daily_refund.order_distinct_count, daily_refund.sum_of_refund_amount]
  }
}
explore: order_summary_2 {}
# explore: find_date_number {}
