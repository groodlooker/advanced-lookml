# If necessary, uncomment the line below to include explore_source.
# include: "advancedlookml_rg.model.lkml"

view: user_order_facts {
  derived_table: {
    datagroup_trigger: advancedlookml_rg_default_datagroup
    distribution_style: all
    indexes: ["user_id"]
    explore_source: order_items {
      column: user_id {}
      column: max_of_order {}
      column: min_of_order {}
      column: total_sale_price {}
      column: lifetime_orders {}
      column: distinct_months {}
    }
  }
  dimension: user_id {
    type: number
    primary_key: yes
    hidden: yes
  }
  dimension: max_of_order {
    type: number
  }
  dimension: min_of_order {
    type: number
  }
  dimension: total_sale_price {
    value_format: "$#,##0"
    type: number
  }
  dimension: lifetime_orders {
    type: number
  }
  dimension: distinct_months {
    type: number
  }
}
