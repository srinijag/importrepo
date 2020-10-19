# include: "test_aa.model.lkml"

view: ndt_flights {
  derived_table: {
    explore_source: flights {
      column: id2 {}
      column: destination {}
      column: distance {}
      column: diverted {}
      derived_column: rank { sql: RANK() OVER (ORDER BY destination desc) ;;}
      bind_all_filters: no
    }
  }
  dimension: destination {}
  dimension: rank { type: number}
  dimension: distance { type: number}
  dimension: diverted {}
dimension: id2 { type: number}
}
