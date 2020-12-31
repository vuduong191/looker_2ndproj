view: find_date_number {
  derived_table: {
    explore_source: order_summary {
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
