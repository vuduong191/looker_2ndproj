# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: klaviyo_campaign_revenue {
  derived_table: {
    explore_source: klaviyo_placed_order {
      column: campaign {}
      column: count_of_order {}
      column: revenue {}
      filters: {
        field: klaviyo_placed_order.campaign
        value: "-NULL"
      }
    }
  }
  dimension: campaign {
    primary_key: yes
  }
  measure: count_of_order {
    type: sum
    sql: ${TABLE}.count_of_order ;;
  }
  measure: revenue {
    value_format: "#,##0.00"
    type: sum
    sql: ${TABLE}.revenue ;;
  }
}
