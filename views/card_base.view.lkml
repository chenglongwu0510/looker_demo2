# The name of this view in Looker is "Card Base"
view: card_base {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `looker_demo.card_base` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Card Family" in Explore.

  dimension: card_family {
    type: string
    sql: ${TABLE}.Card_Family ;;
  }

  dimension: card_number {
    type: string
    sql: ${TABLE}.Card_Number ;;
  }

  dimension: credit_limit {
    type: number
    sql: ${TABLE}.Credit_Limit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_credit_limit {
    type: sum
    sql: ${credit_limit} ;;  }
  measure: average_credit_limit {
    type: average
    sql: ${credit_limit} ;;  }

  dimension: cust_id {
    type: string
    sql: ${TABLE}.Cust_ID ;;
  }
  measure: count {
    type: count
  }
}
