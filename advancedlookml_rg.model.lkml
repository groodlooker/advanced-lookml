connection: "thelook_events"

# include all the views
include: "*.view"

datagroup: advancedlookml_rg_default_datagroup {
  sql_trigger: SELECT MAX(created_date) FROM order_items;;
  max_cache_age: "1 hour"
}

persist_with: advancedlookml_rg_default_datagroup

explore: order_items {
  join: user_order_facts {
    sql_on: ${order_items.user_id} = ${user_order_facts.user_id} ;;
    relationship: many_to_one
  }
}
