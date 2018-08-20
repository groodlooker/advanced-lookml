connection: "thelook_events"

# include all the views
include: "*.view"

datagroup: advancedlookml_rg_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: advancedlookml_rg_default_datagroup

explore: order_items {}
