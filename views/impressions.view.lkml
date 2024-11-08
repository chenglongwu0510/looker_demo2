# The name of this view in Looker is "Impressions"
view: impressions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.

  parameter: age_range {
    type: string
    allowed_value: {
      label: "Less than 20"
      value: "< 20"
    }
    allowed_value: {
      label: "Less than 30"
      value: "< 30"
    }
    allowed_value: {
      label: "All Results"
      value: "> 0"
    }
  }

  # sql_table_name: `looker_demo_2.impressions` ;;
  derived_table: {
    sql:
      SELECT
        *
      FROM
        impressions
      WHERE
        age < {{ _user_attributes['chenglong_demo_age_filter'] }}
    ;;
  }
        # {% condition age_filter %} order.age {% endcondition %}
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.
  # parameter: number_per_page {
  #   default_value: "10"
  #   type: number
  # }



  # filter: age_filter {
  #   type: number
  #   suggest_dimension: age
  # }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;  }

  measure: average_age {
    type: average
    sql: ${age} ;;  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: platform {
    type: string
    sql: ${TABLE}.platform ;;
  }
  measure: count {
    type: count
    drill_fields: [country, city]
  }

}
