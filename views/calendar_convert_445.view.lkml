view: calendar_convert_445 {
  sql_table_name: `google_sheets.calendar_convert_445`
    ;;

  dimension: _445_month {
    type: number
    sql: ${TABLE}._445_month ;;
  }

  dimension: _445_quarter {
    type: number
    sql: ${TABLE}._445_quarter ;;
  }

  dimension: _445_week {
    type: number
    sql: ${TABLE}._445_week ;;
  }

  dimension: _445_year {
    type: number
    sql: ${TABLE}._445_year ;;
  }

  dimension: date_string {
    primary_key: yes
    type: string
    sql: ${TABLE}.date_string ;;
  }
  dimension: date_number_445_full {
    type: number
    sql: 1000000*${_445_year}+10000*${_445_quarter}+100*${_445_month}+${_445_week} ;;
  }
  measure: current_date_number_445_start  {
    # hidden: yes
    type: min
    sql: ${date_number_445_full} ;;
  }
  measure: current_date_number_445_end {
    type: max
    # hidden: yes
    sql: ${date_number_445_full} ;;
  }
}
