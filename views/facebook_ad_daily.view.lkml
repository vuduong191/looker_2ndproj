# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: facebook_ad_daily {
  derived_table: {
    explore_source: facebook_ad_insight {
      column: vu_date_string {}
      column: total_of_spend {}
      filters: {
        field: facebook_ad_insight.account_name
        value: "ettitude"
      }
    }
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
  measure: total_of_spend {
    label: "Facebook Ads Spend"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_of_spend ;;
  }
}
