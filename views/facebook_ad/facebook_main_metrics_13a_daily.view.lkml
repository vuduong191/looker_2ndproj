# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: facebook_main_metrics_13a_daily {
  derived_table: {
    explore_source: facebook_main_metrics_13a {
      column: clicks {}
      column: impressions {}
      column: spend {}
      column: campaign_id {}
      column: campaign_name {}
      column: vu_date_string {}
      filters: {
        field: facebook_main_metrics_13a.account_id
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
    description: "Date in yyyymmdd format"
  }
  dimension: campaign_id {}
  dimension: pk {
    primary_key: yes
    hidden: yes
    sql: ${campaign_id} || ${vu_date_string} ;;
  }
  dimension: campaign_name {}
  dimension: campaign_type {
    type: string
    sql: CASE LEFT(${campaign_name},18)
            WHEN "paid_social_au_acq" THEN "acquisition"
            WHEN "paid_social_au_rtg" THEN "retargeting"
            WHEN "paid_social_au_tst" THEN "testing"
            ELSE "undefined"
          END ;;
  }
}
