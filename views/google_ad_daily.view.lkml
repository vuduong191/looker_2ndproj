# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: google_ad_daily {
  derived_table: {
    explore_source: google_ad {
      column: vu_date_string {}
      column: total_of_cost {}
      column: total_of_impressions {}
      column: total_of_conversions {}
      column: total_of_conversion_value {}
      column: total_of_clicks {}
    }
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }

  measure: total_of_cost {
    label: "Google Ads Spend"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_of_cost ;;
  }
  measure: total_of_impressions {
    type: sum
    sql: ${TABLE}.total_of_impressions ;;
  }
  measure: total_of_conversions {
    type: sum
    sql: ${TABLE}.total_of_conversions ;;
  }
  measure: total_of_conversion_value {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_of_conversion_value ;;
  }
  measure: total_of_clicks {
    type: sum
    sql: ${TABLE}.total_of_clicks ;;
  }
}
