connection: "thelook"

# include all the views
include: "/views/**/*.view"

datagroup: test_aa_default_datagroup {
  sql_trigger: SELECT CURRENT_TIMESTAMP;;
  max_cache_age: "1 hour"
}

persist_with: test_aa_default_datagroup


explore: flights {
    access_filter: {
      field: flights.destination
      user_attribute: test_aa
    }
    join: ndt_flights {
      sql_on: ${flights.id2} = ${ndt_flights.id2} ;;
      relationship: one_to_one
    }
  }


# Place in `test_aa` model
explore: +flights {
  aggregate_table: rollup__destination__distance__diverted {
    query: {
      dimensions: [
        destination,
        distance,
        diverted,
        ndt_flights.destination,
        ndt_flights.rank
      ]
      filters: []
    }
    materialization: {
      datagroup_trigger: test_aa_default_datagroup }
    }}


# explore: imgsrc1onerroralert2 {}

# explore: inventory_items {
#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: order_items {
#   join: orders {
#     type: left_outer
#     sql_on: ${order_items.order_id} = ${orders.id} ;;
#     relationship: many_to_one
#   }

#   join: inventory_items {
#     type: left_outer
#     sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
#     relationship: many_to_one
#   }

#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }

#   join: products {
#     type: left_outer
#     sql_on: ${inventory_items.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: orders {
#   join: users {
#     type: left_outer
#     sql_on: ${orders.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: products {}

# explore: saralooker {
#   join: users {
#     type: left_outer
#     sql_on: ${saralooker.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }

# explore: user_data {
#   join: users {
#     type: left_outer
#     sql_on: ${user_data.user_id} = ${users.id} ;;
#     relationship: many_to_one
#   }
# }
