# include: "test_aa.model.lkml"

view: ndt_flights {
  derived_table: {
    explore_source: flights {
      column: destination {}
      column: distance {}
      column: diverted {}
      derived_column: rank { sql: RANK() OVER (partition by flights ORDER BY distance desc) ;;}
    }
  }
  dimension: destination {}
  dimension: rank { type: string}
  dimension: distance { type: number}
  dimension: diverted {}
}
