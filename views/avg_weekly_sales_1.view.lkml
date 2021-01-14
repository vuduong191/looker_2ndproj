view: avg_weekly_sales_1 {
    derived_table: {
      sql_trigger_value: SELECT EXTRACT(WEEK FROM TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL -10 MINUTE) AT TIME ZONE "America/Los_Angeles") ;;
      explore_source: order_line {
        column: sku {}
        column: created_week { field: order.created_week }
        column: is_cancelled {field: order.is_cancelled}
        column: sum_of_quantity {}
        column: total_price {}
        column: category { field: vu_product_data_au.category }
        column: color { field: vu_product_data_au.color }
        column: material { field: vu_product_data_au.material }
        column: product { field: vu_product_data_au.product }
        column: size { field: vu_product_data_au.size }
        filters: [
          inventory_week_active.is_inactive : "No",
          order_is_marketing.is_marketing: "No",
          order.is_cancelled : "No",
          order_is_b2b.is_b2b : "No"
        ]
        filters: {
          field: order.source_name
          value: "web,580111"
        }
      }
    }
    dimension: sku {}
    dimension: created_week {
      type: date_week
    }
    dimension: sum_of_quantity {
      label: "Order Line Total Unit Sold"
      value_format: "#,##0"
      type: number
    }
    dimension: total_price {
      value_format: "$#,##0.00"
      type: number
    }
    dimension: category {
      label: "Product Category Vu"
    }
    dimension: color {
      label: "Product Color Vu"
    }
    dimension: material {
      label: "Product Material Vu"
    }
    dimension: product {
      label: "Product Vu"
    }
    dimension: size {
      label: "Product Size Vu"
    }
    measure: avg_weekly_units_sold {
      type: average
      value_format: "0.00"
      sql: ${sum_of_quantity} ;;
    }
    measure: avg_weekly_sales {
      type: average
      value_format:"$0.00"
      sql: ${total_price} ;;
    }
    measure: active_week_count {
      type: count_distinct
      value_format:"0"
      sql: ${created_week} ;;
    }
  }
