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
  dimension: date_number {
    type: number
    sql: CAST(${TABLE}.date_string AS INT64);;
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
  dimension: _445_month_text {
    type: string
    sql: CONCAT(${_445_year},"-", FORMAT("%02d", ${_445_month})) ;;
  }
  dimension: _445_week_text {
    type: string
    sql: CONCAT(${_445_year}, "-W", FORMAT("%02d", ${_445_week})) ;;
  }
  dimension: date_number_445_quarter {
    type: number
    sql: CAST(FLOOR(${date_number_445_full}/10000) AS INT64);;
  }

  dimension: date_number_445_month {
    type: number
    sql: CAST(FLOOR(${date_number_445_full}/100) AS INT64);;
  }
  dimension: _445_quarter_text {
    type: string
    sql: CONCAT(${_445_year}, "-Q", ${_445_quarter}) ;;
  }

# Refund
}
