# The name of this view in Looker is "Funnel"
view: funnel {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_demo_2.funnel` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called " Buy" in Explore.

  dimension: _buy {
    type: number
    sql: ${TABLE}._buy ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total__buy {
    type: sum
    sql: ${_buy} ;;  }
  measure: average__buy {
    type: average
    sql: ${_buy} ;;  }

  dimension: _checkout {
    type: number
    sql: ${TABLE}._checkout ;;
  }

  dimension: add_to_cart {
    type: yesno
    sql: ${TABLE}.add_to_cart ;;
  }

  dimension: buy {
    type: yesno
    sql: ${TABLE}.buy ;;
  }

  dimension: checkout {
    type: yesno
    sql: ${TABLE}.checkout ;;
  }

  dimension: sell {
    type: yesno
    sql: ${TABLE}.sell ;;
  }

  dimension: stock_symbol {
    type: string
    sql: ${TABLE}.stock_symbol ;;
  }

  dimension: transaction_id {
    type: number
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: user {
    type: string
    sql: ${TABLE}.user ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
