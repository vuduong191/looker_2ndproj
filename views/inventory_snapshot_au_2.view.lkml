# If necessary, uncomment the line below to include explore_source.

# include: "ettitude_vu02_au.model.lkml"

view: inventory_snapshot_au_2 {
  derived_table: {
    explore_source: inventory_snapshot_au {
      column: inventory_quantity {}
      column: pk {}
      column: sku {}
      column: vu_date_string {}
      column: day {field:inventory_snapshot_au.day_date}
      column: _445_week { field: calendar_convert_445._445_week }
      column: _445_month { field: calendar_convert_445._445_month }
      column: _445_quarter { field: calendar_convert_445._445_quarter }
      column: _445_year { field: calendar_convert_445._445_year }
      column: date_number { field: calendar_convert_445.date_number }
      column: _445_week_text { field: calendar_convert_445._445_week_text }
      column: _445_month_text { field: calendar_convert_445._445_month_text }
      column: _445_quarter_text { field: calendar_convert_445._445_quarter_text }

      column: date_number_445_full { field: calendar_convert_445.date_number_445_full }
      column: date_number_445_month { field: calendar_convert_445.date_number_445_month }
      column: date_number_445_quarter { field: calendar_convert_445.date_number_445_quarter }
      column: date_string { field: calendar_convert_445.date_string }
      derived_column: end_of_week_stock {
        sql:  FIRST_VALUE(inventory_quantity) OVER (PARTITION BY _445_week_text, sku ORDER BY date_string DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);;
      }
      derived_column: end_of_month_stock {
        sql:  FIRST_VALUE(inventory_quantity) OVER (PARTITION BY _445_month_text, sku ORDER BY date_string DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);;
      }
      derived_column: end_of_quarter_stock {
        sql:  FIRST_VALUE(inventory_quantity) OVER (PARTITION BY _445_quarter_text, sku ORDER BY date_string DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);;
      }
      derived_column: end_of_year_stock {
        sql:  FIRST_VALUE(inventory_quantity) OVER (PARTITION BY _445_year, sku ORDER BY date_string DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING);;
      }
    }
  }
  dimension: day {
    type: date
    convert_tz: no
  }
  dimension: inventory_quantity {
    type: number
  }
  dimension: end_of_week_stock {
    type: number
  }
  dimension: end_of_month_stock {
    type: number
  }
  dimension: end_of_quarter_stock {
    type: number
  }
  dimension: end_of_year_stock {
    type: number
  }
  dimension: pk {
    primary_key: yes
  }
  dimension: sku {}
  dimension: vu_date_string {
    description: "Date in yyyymmdd format"
  }
  dimension: _445_month {
    type: number
  }
  dimension: _445_quarter {
    type: number
  }
  dimension: _445_week {
    type: number
  }
  dimension: _445_year {
    type: number
  }
  dimension: date_number {
    type: number
  }
  dimension: _445_month_text {}
  dimension: _445_quarter_text {}
  dimension: _445_week_text {}
  dimension: date_number_445_full {
    type: number
  }
  dimension: date_number_445_month {
    type: number
  }
  dimension: date_number_445_quarter {
    type: number
  }
  dimension: date_string {}
}
