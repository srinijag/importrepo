connection: "bigquery_test_db_connection"

# include all the views
include: "/views/**/*.view"

datagroup: bq_stableview_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: bq_stableview_test_default_datagroup

explore: customer_order_facts {}

explore: all_types {}

explore: connection_reg_r3 {}

explore: nested_and_repeated {
  join: nested_and_repeated__nested_field {
    view_label: "Nested And Repeated: Nested Field"
    sql: LEFT JOIN UNNEST([${nested_and_repeated.nested_field}]) as nested_and_repeated__nested_field ;;
    relationship: one_to_one
  }

  join: nested_and_repeated__doubly_nested_and_repeated {
    view_label: "Nested And Repeated: Doubly Nested And Repeated"
    sql: LEFT JOIN UNNEST(${nested_and_repeated.doubly_nested_and_repeated}) as nested_and_repeated__doubly_nested_and_repeated ;;
    relationship: one_to_many
  }
}

explore: order_items {
  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
