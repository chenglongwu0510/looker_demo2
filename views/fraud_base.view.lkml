# The name of this view in Looker is "Fraud Base"
view: fraud_base {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_demo.fraud_base` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Fraud Flag" in Explore.

  dimension: fraud_flag {
    type: number
    sql: ${TABLE}.Fraud_Flag ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_fraud_flag {
    type: sum
    sql: ${fraud_flag} ;;  }
  measure: average_fraud_flag {
    type: average
    sql: ${fraud_flag} ;;  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.Transaction_ID ;;
  }
  measure: count {
    type: count
  }
}
