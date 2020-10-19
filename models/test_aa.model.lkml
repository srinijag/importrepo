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
# explore: +flights {
#   aggregate_table: rollup__destination__distance__diverted {
#     query: {
#       dimensions: [
#         destination,
#         distance,
#         diverted,
#         ndt_flights.destination,
#         ndt_flights.rank
#       ]
#       filters: []
#     }
#     materialization: {
#       datagroup_trigger: test_aa_default_datagroup }
#     }}
