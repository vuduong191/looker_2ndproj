# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_daily_revenue_13a {
  derived_table: {
    explore_source: facebook_13_action_values {
      column: vu_date_string {}
      column: campaign_id {}
      column: sum_of_value {}
      filters: {
        field: facebook_13_action_values.action_type
        value: "omni_purchase"
      }
    }
  }
  dimension: campaign_id {}
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${campaign_id} || ${vu_date_string} ;;
  }
  measure: revenue {
    value_format_name: "usd"
    type: sum
    sql: ${TABLE}.sum_of_value ;;
  }
}
