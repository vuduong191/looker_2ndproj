# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_us.model.lkml"

view: rakuten_report_daily {
  derived_table: {
    explore_source: rakuten_report {
      column: vu_date_string {}
      column: transaction_raw {}
      column: total_commission_draft {}
      column: market {}
      column: clicks_draft {}
      column: sales_draft {}
      column: orders_draft {}
      filters: {
        field: rakuten_report.market
        value: "au"
      }
    }
  }
  dimension_group: transaction {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_raw ;;
  }
  dimension: vu_date_string {
    primary_key: yes
    description: "Date in yyyymmdd format"
  }
  measure: total_commission {
    label: "Affiliate Commission"
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_commission_draft ;;
  }
  measure: clicks {
    value_format: "0"
    type: sum
    sql: ${TABLE}.clicks_draft ;;
  }
  measure: orders {
    value_format: "0"
    type: sum
    sql: ${TABLE}.orders_draft ;;
  }
  measure: sales {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.sales_draft ;;
  }
}
