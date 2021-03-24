connection: "klaviyo"

# include all the viewsa
include: "/views/**/*.view"
include: "/dashboards/*.dashboard"
week_start_day: sunday
datagroup: daily_datagroup {
  sql_trigger:   SELECT cast(CURRENT_DATE as string); ;;
  max_cache_age: "24 hours"
}

explore: order {
  # join: order_tag {
  #   # view_label: "Order Validity Check"
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on: ${order.id} = ${order_tag.pk2_order_id} ;;
  #   fields: [value, marketing_tag_integer, sum_marketing_tag_integer, sum_b2b_tag_integer]
  # }
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
  join: order_is_excluded_from_report {
    view_label: "Order Validity Check"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order.id} = ${order_is_excluded_from_report.id} ;;
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
    # fields: [order.created_autz_raw,order.created_autz_date,order.created_autz_week,order.created_autz_month, order.created_date, order.created_raw, order.created_week, order.is_cancelled, order.source_name,id, name, min_order_id, order.online_order, order.dynamic_timeframe, order.timeframe_picker, order.date_simple, order.vu_date_string]
    sql_on: ${order.id}=${order_line.order_id} ;;
  }
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${order.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
  # join: order_tag {
  #   view_label: "Order Line"
  #   type: left_outer
  #   relationship: one_to_many
  #   sql_on: ${order_line.order_id} = ${order_tag.pk2_order_id} ;;
  #   fields: [value, marketing_tag_integer, sum_marketing_tag_integer, sum_b2b_tag_integer]
  # }
  join: order_is_marketing {
    # view_label: "Order Line"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_line.id} = ${order_is_marketing.id} ;;
  }
  join: order_is_b2b {
    # view_label: "Order Line"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_line.id} = ${order_is_b2b.id} ;;
  }
  join: order_is_excluded_from_report {
    # view_label: "Order Line"
    type: left_outer
    relationship: one_to_one
    sql_on: ${order_line.id} = ${order_is_excluded_from_report.id} ;;
  }
  join: product {
    # view_label: "Order Line"
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

explore: inventory_snapshot_au {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${inventory_snapshot_au.vu_date_string} = ${calendar_convert_445.date_string} ;;
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
explore: bundle_sales {}
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
explore: variant_daily_sales {
  join: find_date_number_2 {
    type: cross
    relationship: many_to_one
  }
  join: inventory_snapshot_au_2 {
    relationship: many_to_one
    sql_on: ${inventory_snapshot_au_2.pk}=${variant_daily_sales.sku_date} ;;
  }
}
explore: variant_daily_sales_2 {
  join: inventory_snapshot_au {
    relationship: many_to_one
    sql_on: ${variant_daily_sales_2.pk_to_lookup} = ${inventory_snapshot_au.pk} ;;
  }
}
explore: calendar_convert_445 {
}
explore: inventory_snapshot_au_2 {
  join: variant_daily_sales {
    relationship: one_to_many
    sql_on: ${inventory_snapshot_au_2.pk}=${variant_daily_sales.sku_date} ;;
  }
  join: vu_product_data_au {
    type: left_outer
    view_label: "Manual Data"
    relationship: many_to_one
    sql_on: ${inventory_snapshot_au_2.sku}=${vu_product_data_au.product_variant_sku} ;;
  }
}
explore: variant_daily_sales_3 {}
explore: facebook_ad_insight {}
explore: google_ad{}
explore: google_ad_daily {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${google_ad_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: facebook_ad_daily {}
explore: bing_ad {}
explore: bing_ad_daily {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${bing_ad_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: rakuten_report {}
explore: rakuten_report_daily {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${rakuten_report_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: base_445_calendar {
  join: google_ad_daily {
    relationship: many_to_one
    view_label: "Marketing Channel Expenses"
    sql_on: ${base_445_calendar.date_string}=${google_ad_daily.vu_date_string} ;;
  }
  join: facebook_ad_daily {
    relationship: many_to_one
    view_label: "Marketing Channel Expenses"
    sql_on: ${base_445_calendar.date_string}=${facebook_ad_daily.vu_date_string} ;;
  }
  join: rakuten_report_daily {
    relationship: many_to_one
    view_label: "Marketing Channel Expenses"
    sql_on: ${base_445_calendar.date_string}=${rakuten_report_daily.vu_date_string} ;;
  }
  join: bing_ad_daily {
    relationship: many_to_one
    view_label: "Marketing Channel Expenses"
    sql_on: ${base_445_calendar.date_string}=${bing_ad_daily.vu_date_string} ;;
  }
  join: order_summary {
    relationship: many_to_one
    view_label: "Sales Performance"
    sql_on: ${base_445_calendar.date_string}=${order_summary.vu_date_string} ;;
    fields: [order_summary.sum_of_net_sales,order_summary.sum_of_gross_sales,order_summary.sum_of_total_discounts, order_summary.count_of_order]
  }
  join: daily_refund {
    relationship: many_to_one
    sql_on: ${order_summary.vu_date_string} = ${daily_refund.vu_date_string} ;;
    fields: [daily_refund.order_distinct_count, daily_refund.sum_of_refund_amount]
  }
  join: ga_order_count_paid_non_paid_daily {
    relationship: many_to_one
    sql_on: ${order_summary.vu_date_string} = ${ga_order_count_paid_non_paid_daily.vu_date_string} ;;
    fields: [ga_order_count_paid_non_paid_daily.count_of_non_paid_orders, ga_order_count_paid_non_paid_daily.count_of_paid_orders]
  }
}
explore: ga_channel_performance {}
explore: ga_order_count_paid_non_paid_daily {}
explore: ga_channel_main_metrics{
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${ga_channel_main_metrics.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: rakuten_report_pub_daily{
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${rakuten_report_pub_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: facebook_main_metrics {}
explore: facebook_action {}
explore: facebook_action_value {}
explore: facebook_main_metrics_daily {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
  join: facebook_daily_order_count {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_daily.vu_date_string} = ${facebook_daily_order_count.vu_date_string} ;;
  }
  join: facebook_daily_revenue {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_daily.vu_date_string} = ${facebook_daily_revenue.vu_date_string} ;;
  }
}
explore: pinterest_advertiser_report {}
explore: pinterest_daily_performance {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${pinterest_daily_performance.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: facebook_daily_revenue {}
explore: klaviyo_placed_order {}
explore: klaviyo_event {}
explore: klaviyo_campaign {}
explore: klaviyo_campaign_main_metrics {
  join: klaviyo_campaign_revenue {
    relationship: one_to_one
    sql_on: ${klaviyo_campaign_main_metrics.campaign_id}=${klaviyo_campaign_revenue.campaign} ;;
  }
  join: klaviyo_campaign {
    relationship: many_to_one
    sql_on: ${klaviyo_campaign_main_metrics.campaign_id} = ${klaviyo_campaign.id} ;;
  }
}
explore: google_ads_campaign {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${google_ads_campaign.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
}
explore: facebook_main_metrics_13a {}
explore: facebook_13_actions {}
explore: facebook_13_action_values {}
explore: facebook_main_metrics_13a_daily {
  join: calendar_convert_445 {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_13a_daily.vu_date_string} = ${calendar_convert_445.date_string} ;;
    # fields: [calendar_convert_445._445_month, calendar_convert_445._445_quarter, calendar_convert_445._445_year, calendar_convert_445._445_week, calendar_convert_445.date_number_445_full, calendar_convert_445.current_date_number_445_start, calendar_convert_445.current_date_number_445_end]
  }
  join: facebook_daily_order_count_13a {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_13a_daily.pk} = ${facebook_daily_order_count_13a.pk} ;;
  }
  join: facebook_daily_revenue_13a {
    relationship: many_to_one
    sql_on: ${facebook_main_metrics_13a_daily.pk} = ${facebook_daily_revenue_13a.pk} ;;
  }
}
explore: ga_campaign_performance_au {}
# test
explore: gift_card {}
