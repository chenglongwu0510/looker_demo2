view: dynamic_view {
  sql_table_name: looker_demo_2.{{ _user_attributes['chenglong_demo_dynamic_table'] }} ;; # clicks , funnel


  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

}
