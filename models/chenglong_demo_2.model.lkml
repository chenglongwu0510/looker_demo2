# Define the database connection to be used for this model.
connection: "chenglong_bigquery_demo_2"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: chenglong_demo_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: chenglong_demo_2_default_datagroup

access_grant: can_view_clicks {
  user_attribute: chenglong_demo_access_grant
  allowed_values: ["YES"]
}

access_grant: can_view_clicks_age {
  user_attribute: chenglong_demo_access_grant
  allowed_values: ["YES"]
}


# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Chenglong Demo 2"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: country_cities {
  # access_filter: {
  #   field: string_field_0
  #   user_attribute: chenglong_demo_user_attribute
  # }
}

explore: sql_datetime {}

explore: cloud_assets {}

explore: customer_acquisition {}

explore: funnel {}

explore: impressions {}

explore: clicks {
  # access_filter: {
  #   field: country
  #   user_attribute: chenglong_demo_user_attribute
  # }
}

explore : dynamic_view {}
