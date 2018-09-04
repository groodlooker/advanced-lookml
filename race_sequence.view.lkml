# If necessary, uncomment the line below to include explore_source.
# include: "bsandell.view.lkml"

view: race_sequence {
  derived_table: {
    explore_source: rg_race_results {
      column: racer_id {}
      column: pitstop_id {}
      column: time_spent_in_pit {}
      derived_column: pitstop_sequence {
        sql: RANK() OVER(PARTITION BY racer_id ORDER BY pitstop_id asc) ;;
      }
      derived_column: change_in_pit_length {
        sql: time_spent_in_pit - (LAG(time_spent_in_pit,1) OVER(PARTITION BY racer_id ORDER BY pitstop_id asc)) ;;
      }
    }
  }
  dimension: racer_id {
    hidden: yes
    type: number
  }
  dimension: pitstop_id {
    hidden: yes
    primary_key: yes
    type: number
  }
  dimension: pitstop_sequence {
    type: number
  }
  dimension: change_in_pit_length {
    type: number
  }
}
