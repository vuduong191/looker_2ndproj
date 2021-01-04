
view: bundle_sales {
  derived_table: {
    explore_source: order_line {
      column: property_discount_name {}
      column: property_complete_bundle {field: order_line.property_complete_bundle}
      column: created_raw { field: order.created_raw }
      column: total_pre_tax_price {}
      column: sum {}
      column: order_count {}
      column: count {}
      # filters: {
      #   field: order_line.property_complete_bundle
      #   value: "1"
      # }
    }
  }
  dimension_group: createdgroup {
    convert_tz: no
    type: time
    timeframes: [raw, date, week, month, year]
    datatype: timestamp
    sql: ${TABLE}.created_raw;;
  }
  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Date" }
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    default_value: "Date"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
    WHEN {% parameter timeframe_picker %} = 'Date' THEN CAST(${createdgroup_date} AS STRING)
    WHEN {% parameter timeframe_picker %} = 'Week' THEN CAST(DATE_TRUNC(${createdgroup_date}, WEEK) AS STRING)
    WHEN{% parameter timeframe_picker %} = 'Month' THEN CAST(DATE_TRUNC(${createdgroup_date}, MONTH) AS STRING)
    END ;;
  }
  dimension: property_discount_name {}
  dimension: property_complete_bundle_text {
    type: string
    sql: CAST(${property_complete_bundle} AS STRING) ;;
  }
  dimension: property_complete_bundle {
    hidden: yes
  }
  dimension: created_raw {
    primary_key: yes
    hidden: yes
    type: date
  }
  # dimension: total_pre_tax_price {
  #   value_format: "$#,##0.00"
  #   type: number
  # }
  dimension: sum {
    label: "Order Line Total Unit Sold"
    value_format: "#,##0"
    type: number
  }
  # dimension: order_count {
  #   label: "Order Line Number of Orders"
  #   type: number
  # }
  dimension: count {
    label: "Order Line Number of Line Items"
    type: number
  }
  measure: total_pre_tax_price {
    label: "Net Sales"
    value_format: "#,##0"
    type: sum
    # description: "Net Sales"
    sql: ${TABLE}.total_pre_tax_price ;;
  }
  measure: bundle_total_pre_tax_price {
    label: "Bundle Net Sales"
    value_format: "#,##0"
    type: sum
    # description: "Net Sales"
    sql: ${TABLE}.total_pre_tax_price ;;
    filters: {
      field: property_complete_bundle_text
      value: "1"
    }
    drill_fields: [property_discount_name, bundle_total_pre_tax_price]
  }
  measure: order_count {
    type: sum
    # description: "Net Sales"
    sql: ${TABLE}.order_count ;;
  }
  measure: bundle_order_count {
    type: sum
    # description: "Net Sales"
    sql: ${TABLE}.order_count ;;
    filters: {
      field: property_complete_bundle_text
      value: "1"
    }
    drill_fields: [property_discount_name, bundle_order_count]
  }
}
