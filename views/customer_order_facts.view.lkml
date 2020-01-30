view: customer_order_facts {
    derived_table: {
      publish_as_db_view: yes
      sql:
      SELECT
        user_id,
        SUM(order_amount) AS lifetime_amount
      FROM
        orders
      GROUP BY
        user_id ;;
    }
    dimension: user_id {
      type: number
      primary_key: yes
      sql: ${TABLE}.user_id ;;
    }

    dimension: lifetime_amount {
      type: number
      value_format: "0.00"
      sql: ${TABLE}.lifetime_amount ;;
    }
  }
