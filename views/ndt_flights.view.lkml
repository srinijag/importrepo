# include: "test_aa.model.lkml"

view: ndt_flights {
  derived_table: {
    explore_source: flights {
      column: destination {}
      column: distance {}
      column: diverted {}
    }
  }
  dimension: destination {}
  dimension: distance {
    type: number
  }
  dimension: diverted {}
}
