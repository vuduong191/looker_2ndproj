view: inventory_insert {
  derived_table: {
    sql_trigger_value: SELECT EXTRACT(DATE FROM TIMESTAMP_ADD(CURRENT_TIMESTAMP, INTERVAL 10 MINUTE) AT TIME ZONE "Australia/Melbourne") ;;
    create_process: {
      sql_step: CREATE TABLE ${SQL_TABLE_NAME} as
        SELECT product_variant.sku AS product_variant_sku, MAX(product_variant.inventory_quantity) AS inventory_quantity, CURRENT_DATE AS day
        FROM `aerobic-datum-283623.shopify_au.product_variant` AS product_variant GROUP BY 1;;
      sql_step:
        INSERT INTO looker_scratch.inventory_snapshot_au SELECT
          product_variant_sku,
          day,
          inventory_quantity
        FROM  ${SQL_TABLE_NAME};;
    }
  }
}
