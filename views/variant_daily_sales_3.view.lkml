# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: variant_daily_sales_3 {
  derived_table: {
    explore_source: inventory_snapshot_au_2 {
      column: day {}
      column: sku {}
      column: inventory_quantity {}
      column: end_of_year_stock {}
      column: end_of_week_stock {}
      column: end_of_quarter_stock {}
      column: end_of_month_stock {}
      column: pk {}
      column: date_string {}
      column: date_number_445_quarter {}
      column: date_number_445_month {}
      column: date_number_445_full {}
      column: date_number {}
      column: _445_year {}
      column: _445_week_text {}
      column: _445_week {}
      column: _445_quarter_text {}
      column: _445_quarter {}
      column: _445_month_text {}
      column: _445_month {}
      column: total_pre_tax_price { field: variant_daily_sales.total_pre_tax_price }
      column: total_unit_sold { field: variant_daily_sales.total_unit_sold }
      column: color { field: vu_product_data_au.color}
      column: category { field: vu_product_data_au.category}
      column: material { field: vu_product_data_au.material}
      column: product { field: vu_product_data_au.product}
      column: size { field: vu_product_data_au.size}
    }
  }
  dimension: day {
    convert_tz: no
    type: date
  }
  dimension: sku {  }
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
  dimension: pk {}
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
    label: "Sales"
    type: sum
    sql: ${TABLE}.total_pre_tax_price ;;
    drill_fields: [sku,day,date_number_445_full,product,color,size,total_pre_tax_price,total_unit_sold,total_of_ending_inventory]
  }
  measure: total_unit_sold {
    value_format: "#,##0"
    label: "U Sold"
    type: sum
    sql: ${TABLE}.total_unit_sold ;;
    drill_fields: [sku,day,date_number_445_full,product,color,size,total_pre_tax_price,total_unit_sold,total_of_ending_inventory]
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
    allowed_value: {  value: "SKU-Product-Size-Color-Material" }
    allowed_value: {  value: "Product-Size-Color" }
    allowed_value: {  value: "Product-Size-Color-Material"}
    allowed_value: {  value: "Color"}
    allowed_value: {  value: "Material"}
    allowed_value: {  value: "SKU"}
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
      WHEN {% parameter product_grouping_picker %} = 'SKU-Product-Size-Color' THEN CONCAT(IFNULL(${sku},"na"),"-",IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'SKU-Product-Size-Color-Material' THEN CONCAT(IFNULL(${sku},"na"),"-",IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"),"-", IFNULL(${material},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Size-Color' THEN CONCAT(IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Product-Size-Color-Material' THEN CONCAT(IFNULL(${product},"na"),"-",IFNULL(${size},"na"),"-", IFNULL(${color},"na"),"-", IFNULL(${material},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Color' THEN CONCAT(IFNULL(${color},"na"))
      WHEN {% parameter product_grouping_picker %} = 'Material' THEN CONCAT(IFNULL(${material},"na"))
      WHEN {% parameter product_grouping_picker %} = 'SKU' THEN CONCAT(IFNULL(${sku},"na"))
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
  dimension: dynamic_end_of_period_inventory_quantity {
    type: number
    sql:
    CASE
      WHEN {% parameter timeframe_picker %} = 'Quarter' THEN ${end_of_quarter_stock}
      WHEN {% parameter timeframe_picker %} = 'Week' THEN ${end_of_week_stock}
      WHEN {% parameter timeframe_picker %} = 'Month' THEN ${end_of_month_stock}
    END ;;
  }
  dimension: dynamic_week_count {
    hidden: yes
    type: number
    sql:
    CASE
      WHEN {% parameter timeframe_picker %} = 'Quarter' THEN 13
      WHEN {% parameter timeframe_picker %} = 'Month' AND MOD(${_445_month},3)=0 THEN 5
      WHEN {% parameter timeframe_picker %} = 'Month' THEN 4
      WHEN {% parameter timeframe_picker %} = 'Week' THEN 1
    END ;;
  }
  measure: dynamic_week_count_final {
    label: "Wk Ct"
    type: median
    sql: ${dynamic_week_count} ;;
  }
  measure: total_of_ending_inventory {
    type: sum_distinct
    label: "Tot Ending Inv"
    sql_distinct_key: ${sku};;
    sql: ${dynamic_end_of_period_inventory_quantity} ;;
    drill_fields: [sku,day,date_number_445_full,product,color,size,total_pre_tax_price,total_unit_sold,total_of_ending_inventory]
  }
  measure: sell_through_rate {
    label: "ST %"
    type: number
    value_format_name: percent_2
    sql: ${total_unit_sold}/NULLIF(${total_unit_sold}+${total_of_ending_inventory},0) ;;
  }
}
