# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_daily_revenue {
  derived_table: {
    explore_source: facebook_action_value {
      column: vu_date_string {}
      column: sum_of_value {}
      filters: {
        field: facebook_action_value.action_type
        value: "omni_purchase"
      }
      filters: {
        field: facebook_action_value.account_id
        value: "@{facebook_acc_id}"
      }
    }
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
  measure: revenue {
    value_format_name: "usd"
    type: sum
    sql: ${TABLE}.sum_of_value ;;
  }
}
