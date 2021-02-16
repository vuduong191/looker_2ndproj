# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: klaviyo_campaign_main_metrics {
  derived_table: {
    explore_source: klaviyo_event {
      column: campaign_id {}
      column: clicked_email_count {}
      column: opened_email_count {}
      column: received_email_count {}
      filters: {
        field: klaviyo_event.campaign_id
        value: "-NULL"
      }
    }
  }
  dimension: campaign_id {
    primary_key: yes
  }
  dimension: clicked_email_count {
    type: number
  }
  dimension: opened_email_count {
    type: number
  }
  dimension: received_email_count {
    type: number
  }
  measure: total_clicks {
    type: sum
    sql: ${clicked_email_count} ;;
  }
  measure: total_opens {
    type: sum
    sql: ${opened_email_count} ;;
  }
  measure: total_receives {
    type: sum
    sql: ${received_email_count} ;;
  }
}
