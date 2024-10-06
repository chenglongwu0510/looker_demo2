# The name of this view in Looker is "Customer Acquisition"
view: customer_acquisition {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_demo_2.customer_acquisition` ;;
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
    # This dimension will be called " Clicked" in Explore.

  dimension: _clicked {
    type: number
    sql: ${TABLE}._clicked ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total__clicked {
    type: sum
    sql: ${_clicked} ;;  }
  measure: average__clicked {
    type: average
    sql: ${_clicked} ;;  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: clicked {
    type: yesno
    sql: ${TABLE}.clicked ;;
  }

  dimension: impression {
    type: yesno
    sql: ${TABLE}.impression ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: spent {
    type: number
    sql: ${TABLE}.spent ;;
  }
  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
