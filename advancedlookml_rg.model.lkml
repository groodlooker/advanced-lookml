connection: "thelook_events"

# include all the views
include: "*.view"

datagroup: advancedlookml_rg_default_datagroup {
  sql_trigger: SELECT MAX(created_date) FROM order_items;;
  max_cache_age: "1 hour"
}

persist_with: advancedlookml_rg_default_datagroup

explore: order_items {
  join: users {
    sql_on: ${order_items.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
  join: user_order_facts {
    sql_on: ${order_items.user_id} = ${user_order_facts.user_id} ;;
    relationship: many_to_one
  }
  join: inventory_items {
    sql_on: ${inventory_items.id} = ${order_items.inventory_item_id} ;;
    relationship: many_to_one
    type: full_outer
  }
  join: distribution_centers {
    sql_on: ${distribution_centers.id} = ${inventory_items.product_distribution_center_id} ;;
    relationship: many_to_one
  }
}
