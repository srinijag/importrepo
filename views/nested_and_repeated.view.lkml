view: nested_and_repeated {
  sql_table_name: looker_test.nested_and_repeated ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: doubly_nested_and_repeated {
    hidden: yes
    sql: ${TABLE}.doubly_nested_and_repeated ;;
  }

  dimension: nested_field {
    hidden: yes
    sql: ${TABLE}.nested_field ;;
  }

  dimension: repeated_field {
    type: string
    sql: ${TABLE}.repeated_field ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: nested_and_repeated__nested_field {
  dimension: this_inner_float {
    type: number
    sql: ${TABLE}.this_inner_float ;;
  }

  dimension: this_inner_string {
    type: string
    sql: ${TABLE}.this_inner_string ;;
  }
}

view: nested_and_repeated__doubly_nested_and_repeated {
  dimension: inner_repeated {
    type: string
    sql: ${TABLE}.inner_repeated ;;
  }

  dimension: other_field {
    type: number
    sql: ${TABLE}.other_field ;;
  }
}
