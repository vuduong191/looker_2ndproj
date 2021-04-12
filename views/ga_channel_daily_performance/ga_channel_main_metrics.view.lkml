# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: ga_channel_main_metrics {
  derived_table: {
    explore_source: ga_channel_performance {
      column: channel_grouping {}
      column: revenue {}
      column: transaction {}
      column: sum_of_sessions {}
      column: vu_date_string {}
      filters: {
        field: ga_channel_performance.channel_grouping
        value: "Paid Search,Google Shopping,Paid Social,Affiliates,Klaviyo Email,SMS,Friendbuy,Radio/Podcast"
      }
    }
  }
  dimension: channel_grouping {}
  measure: revenue {
    type: sum
    sql: ${TABLE}.revenue ;;
  }
  measure: transaction {
    type: sum
    sql: ${TABLE}.transaction ;;
  }
  measure: sum_of_sessions {
    type: sum
    sql: ${TABLE}.sum_of_sessions ;;
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
}
