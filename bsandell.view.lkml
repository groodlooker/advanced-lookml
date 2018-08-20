view: bsandell {
  sql_table_name: public.bsandell ;;

  dimension: car_id {
    type: number
    sql: ${TABLE}.car_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_time ;;
  }

  dimension: number_of_pit_crew_members {
    type: number
    sql: ${TABLE}.number_of_pit_crew_members ;;
  }

  dimension: pitstop_id {
    type: number
    sql: ${TABLE}.pitstop_id ;;
  }

  measure: average_change_in_pit_length {
    type: average
    value_format_name: decimal_2
    sql: cast(${race_sequence.change_in_pit_length} as float) ;;
  }


  dimension: racer_id {
    type: number
    sql: ${TABLE}.racer_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension: time_spent_in_pit {
    type: number
    sql: datediff('secs',${start_raw},${end_raw}) ;;
  }

  measure: total_time_spent_in_pit {
    type: sum
    sql: ${time_spent_in_pit} ;;
  }

  measure: average_time_spent_in_pit {
    type: average
    sql: ${time_spent_in_pit} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
