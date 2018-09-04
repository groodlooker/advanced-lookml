connection: "thelook_events"

include: "*.view.lkml"         # include all views in this project
# include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: rg_race_results {
  from: bsandell
  join: race_sequence {
    relationship: one_to_one
    sql_on: ${rg_race_results.pitstop_id} = ${race_sequence.pitstop_id} ;;
    type: left_outer
  }

}
