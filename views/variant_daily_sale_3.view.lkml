# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: variant_daily_sale_3 {
  derived_table: {
    explore_source: variant_daily_sales {
      column: created_autz_date {}
      column: product_variant_sku {}
      column: inventory_quantity { field: inventory_snapshot_au_2.inventory_quantity }
      column: end_of_year_stock { field: inventory_snapshot_au_2.end_of_year_stock }
      column: end_of_week_stock { field: inventory_snapshot_au_2.end_of_week_stock }
      column: end_of_quarter_stock { field: inventory_snapshot_au_2.end_of_quarter_stock }
      column: end_of_month_stock { field: inventory_snapshot_au_2.end_of_month_stock }
      column: sku_date {}
      column: _445_week_text { field: inventory_snapshot_au_2._445_week_text }
      column: date_string { field: inventory_snapshot_au_2.date_string }
      column: date_number_445_quarter { field: inventory_snapshot_au_2.date_number_445_quarter }
      column: date_number_445_month { field: inventory_snapshot_au_2.date_number_445_month }
      column: date_number_445_full { field: inventory_snapshot_au_2.date_number_445_full }
      column: date_number { field: inventory_snapshot_au_2.date_number }
      column: _445_year { field: inventory_snapshot_au_2._445_year }
      column: _445_week { field: inventory_snapshot_au_2._445_week }
      column: _445_quarter_text { field: inventory_snapshot_au_2._445_quarter_text }
      column: _445_quarter { field: inventory_snapshot_au_2._445_quarter }
      column: _445_month_text { field: inventory_snapshot_au_2._445_month_text }
      column: _445_month { field: inventory_snapshot_au_2._445_month }
      column: total_pre_tax_price {}
      column: total_unit_sold {}
      column: color {}
      column: category {}
      column: material {}
      column: product {}
      column: size {}
      filters: {
        field: variant_daily_sales.product_variant_sku
        value: "ETBM8889KS"
      }
    }
  }
  dimension: created_autz_date {
    type: date
  }
  dimension: product_variant_sku {
    label: "Variant Daily Sales SKU"
  }
  dimension: inventory_quantity {
    type: number
  }
  dimension: end_of_year_stock {
    type: number
  }
  dimension: end_of_week_stock {
    type: number
  }
  dimension: end_of_quarter_stock {
    type: number
  }
  dimension: end_of_month_stock {
    type: number
  }
  dimension: sku_date {}
  dimension: _445_week_text {}
  dimension: date_string {}
  dimension: date_number_445_quarter {
    type: number
  }
  dimension: date_number_445_month {
    type: number
  }
  dimension: date_number_445_full {
    type: number
  }
  dimension: date_number {
    type: number
  }
  dimension: _445_year {
    type: number
  }
  dimension: _445_week {
    type: number
  }
  dimension: _445_quarter_text {}
  dimension: _445_quarter {
    type: number
  }
  dimension: _445_month_text {}
  dimension: _445_month {
    type: number
  }
  measure: total_pre_tax_price {
    value_format: "$#,##0.00"
    type: sum
    sql: ${TABLE}.total_pre_tax_price ;;
  }
  measure: total_unit_sold {
    value_format: "#,##0"
    type: sum
    sql: ${TABLE}.total_unit_sold ;;
  }
  dimension: color {}
  dimension: category {}
  dimension: material {}
  dimension: product {}
  dimension: size {}
  parameter: product_grouping_picker {
    label: "Product Grouping"
    type: string
    allowed_value: { value: "Category" }
    allowed_value: { value: "Category-Product" }
    allowed_value: { value: "Product" }
    allowed_value: { value: "Product-Size" }
    allowed_value: { value: "Product-Color" }
    allowed_value: { value: "Category-Size" }
    allowed_value: { value: "Category-Color" }
    allowed_value: {  value: "SKU-Product-Size-Color" }
    default_value: "Product"
  }
  dimension: dynamic_product_grouping {
    label: "Dynamic Product Grouping"
    type: string
    sql:
    CASE
      WHEN {% parameter product_grouping_picker %} = 'Category' THEN CONCAT(IFNULL(${category},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Product' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${product},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Size' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${size},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Category-Color' THEN CONCAT(IFNULL(${category},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product' THEN CONCAT(IFNULL(${product},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Size' THEN CONCAT(IFNULL(${product},"na"),"-", IFNULL(${size},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Color' THEN CONCAT(IFNULL(${product},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'SKU-Product-Size-Color' THEN CONCAT(IFNULL(${product_variant_sku},"na"),"-",IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"))
    END ;;
  }

  parameter: timeframe_picker {
    label: "Date Granularity"
    type: string
    allowed_value: { value: "Week" }
    allowed_value: { value: "Month" }
    allowed_value: { value: "Quarter" }
    default_value: "Week"
  }
  dimension: dynamic_timeframe {
    type: string
    sql:
    CASE
      WHEN {% parameter timeframe_picker %} = 'Quarter' THEN _445_quarter_text
      WHEN {% parameter timeframe_picker %} = 'Week' THEN _445_week_text
      WHEN {% parameter timeframe_picker %} = 'Month' THEN _445_month_text
    END ;;
  }
  dimension: dynamic_week_count {
    type: number
    sql:
    CASE
      WHEN {% parameter timeframe_picker %} = 'Quarter' THEN 13
      WHEN {% parameter timeframe_picker %} = 'Month' THEN CASE MOD(${_445_month},3) WHEN 0 THEN 5 ELSE 4
      WHEN {% parameter timeframe_picker %} = 'Week' THEN 1
    END ;;
  }
}
