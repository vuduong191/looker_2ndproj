# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_daily_order_count_13a {
  derived_table: {
    explore_source: facebook_13_actions {
      column: vu_date_string {}
      column: sum_of_value {}
      column: campaign_id {}
      filters: {
        field: facebook_13_actions.action_type
        value: "omni_purchase"
      }
    }
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
  dimension: campaign_id {}
  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${campaign_id} || ${vu_date_string} ;;
  }
  measure: orders {
    type: sum
    sql: ${TABLE}.sum_of_value ;;
  }
}
