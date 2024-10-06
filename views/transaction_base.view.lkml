# The name of this view in Looker is "Transaction Base"
view: transaction_base {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_demo.transaction_base` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Credit Card ID" in Explore.

  dimension: credit_card_id {
    type: string
    sql: ${TABLE}.Credit_Card_ID ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: transaction {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Transaction_Date ;;
  }

  dimension: transaction_id {
    type: string
    sql: ${TABLE}.Transaction_ID ;;
  }

  dimension: transaction_segment {
    type: string
    sql: ${TABLE}.Transaction_Segment ;;
  }

  dimension: transaction_value {
    type: number
    sql: ${TABLE}.Transaction_Value ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_transaction_value {
    type: sum
    sql: ${transaction_value} ;;  }
  measure: average_transaction_value {
    type: average
    sql: ${transaction_value} ;;  }
  measure: count {
    type: count
  }
}
