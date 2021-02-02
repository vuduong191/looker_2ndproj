# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: pinterest_daily_performance {
  derived_table: {
    explore_source: pinterest_advertiser_report {
      column: total_clicks {}
      column: total_impressions {}
      column: total_checkouts {}
      column: total_revenue {}
      column: total_spend {}
      column: vu_date_string {}
      filters: {
        field: pinterest_advertiser_report.advertiser_id
        value: "@{pinterest_acc_id}"
      }
    }
  }
  measure: total_clicks {
    sql:  ${TABLE}.total_clicks;;
    type: sum
  }
  measure: total_impressions {
    sql:  ${TABLE}.total_impressions;;
    type: sum
  }
  measure: total_checkouts {
    sql:  ${TABLE}.total_checkouts;;
    type: sum
  }
  measure: total_revenue {
    sql:  ${TABLE}.total_revenue;;
    value_format: "$###,###.00"
    type: sum
  }
  measure: total_spend {
    sql:  ${TABLE}.total_spend;;
    value_format: "$###,###.00"
    type: sum
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
}
