view: find_date_number_2 {
  derived_table: {
    explore_source: variant_daily_sales {
      bind_all_filters: yes
      column: current_date_number_445_end_constant {}
      column: current_date_number_445_start_constant {}
      timezone: query_timezone
    }
  }
  dimension: current_date_number_445_end_constant {
    type: number
  }
  dimension: current_date_number_445_start_constant {
    type: number
  }
}
