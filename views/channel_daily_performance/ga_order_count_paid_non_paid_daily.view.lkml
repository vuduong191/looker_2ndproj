# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: ga_order_count_paid_non_paid_daily {
  derived_table: {
    explore_source: ga_channel_performance {
      column: vu_date_string {}
      column: count_of_non_paid_orders {}
      column: count_of_paid_orders {}
    }
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
  measure: count_of_non_paid_orders {
    type: sum
    sql: ${TABLE}.count_of_non_paid_orders ;;
  }
  measure: count_of_paid_orders {
    type: sum
    sql: ${TABLE}.count_of_paid_orders ;;
  }
}
