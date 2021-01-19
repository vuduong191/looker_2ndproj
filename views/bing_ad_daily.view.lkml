# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: bing_ad_daily {
  derived_table: {
    explore_source: bing_ad {
      column: vu_date_string {}
      column: total_of_spend {}
      filters: {
        field: bing_ad.account_id
        value: "@{bing_acc_id}"
      }
    }
  }
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
    primary_key: yes
  }
  measure: total_of_spend {
    label: "Bing Ads Spend"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_of_spend ;;
  }
}
