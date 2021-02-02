# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_main_metrics_daily {
  derived_table: {
    explore_source: facebook_main_metrics {
      column: clicks {}
      column: impressions {}
      column: spend {}
      column: vu_date_string {}
      filters: {
        field: facebook_main_metrics.account_id
        value: "@{facebook_acc_id}"
      }
    }
  }
  measure: clicks {
    type: sum
    sql: ${TABLE}.clicks ;;
  }
  measure: impressions {
    type: sum
    sql: ${TABLE}.impressions ;;
  }
  measure: spend {
    value_format_name: "usd"
    sql: ${TABLE}.spend ;;
    type: sum
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
}
