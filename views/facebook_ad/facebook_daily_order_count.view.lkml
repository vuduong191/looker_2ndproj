# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_daily_order_count {
  derived_table: {
    explore_source: facebook_action {
      column: vu_date_string {}
      column: sum_of_value {}
      filters: {
        field: facebook_action.action_type
        value: "omni_purchase"
      }
      filters: {
        field: facebook_action.account_id
        value: "346057911"
      }
    }
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
  measure: orders {
    type: sum
    sql: ${TABLE}.sum_of_value ;;
  }
}
