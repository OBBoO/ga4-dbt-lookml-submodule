connection: "ga4_dbt_lkml_project"

include: "/views/*"

explore: analysis_product_performance {
  description: "This model computes performance metrics of products (eg. product conversion rate & number of product purchase"
}

explore: ga4_events {
  description: "This model cleans and flattens raw GA4 events data."

  # Join with ga4_items
  join: ga4_items {
    type: left_outer  # or inner, based on your data needs
    sql_on: ${ga4_events.join_key} = ${ga4_items.join_key} ;;
    relationship: many_to_one  # Define relationship type
  }

  # Join with ga4_events_params
  join: ga4_events_params {
    type: left_outer  # or inner
    sql_on: ${ga4_events.join_key} = ${ga4_events_params.join_key} ;;
    relationship: many_to_one
  }

  # Join with ga4_user_properties
  join: ga4_user_properties {
    type: left_outer  # or inner
    sql_on: ${ga4_events.join_key} = ${ga4_user_properties.join_key} ;;
    relationship: many_to_one
  }
}

explore: ga4_events_params {
  description: "This model prepares and flattens raw GA4 events data, creating a join key and deduplicating events."

  # Join with ga4_events
  join: ga4_events {
    type: left_outer  # You can change to inner if appropriate
    sql_on: ${ga4_events_params.join_key} = ${ga4_events.join_key} ;;
    relationship: many_to_one  # Define relationship type
  }

  # Join with ga4_items
  join: ga4_items {
    type: left_outer
    sql_on: ${ga4_events_params.join_key} = ${ga4_items.join_key} ;;
    relationship: many_to_one
  }

  # Join with ga4_user_properties
  join: ga4_user_properties {
    type: left_outer
    sql_on: ${ga4_events_params.join_key} = ${ga4_user_properties.join_key} ;;
    relationship: many_to_one
  }
}

explore: ga4_items {
  description: "This model prepares and flattens GA4 items data, creating a join key and deduplicating item events."

  # Join with ga4_events
  join: ga4_events {
    type: left_outer  # Can be inner based on your requirements
    sql_on: ${ga4_items.join_key} = ${ga4_events.join_key} ;;
    relationship: many_to_one  # Define relationship type
  }

  # Join with ga4_events_params
  join: ga4_events_params {
    type: left_outer  # Can be inner if needed
    sql_on: ${ga4_items.join_key} = ${ga4_events_params.join_key} ;;
    relationship: many_to_one
  }

  # Join with ga4_user_properties
  join: ga4_user_properties {
    type: left_outer
    sql_on: ${ga4_items.join_key} = ${ga4_user_properties.join_key} ;;
    relationship: many_to_one
  }
}

explore: ga4_user_properties {
  description: "This model prepares and flattens GA4 user properties data, creating a join key and deduplicating user property events."

  # Join with ga4_events
  join: ga4_events {
    type: left_outer  # You can change to inner if appropriate
    sql_on: ${ga4_user_properties.join_key} = ${ga4_events.join_key} ;;
    relationship: many_to_one  # Define relationship type
  }

  # Join with ga4_items
  join: ga4_items {
    type: left_outer
    sql_on: ${ga4_user_properties.join_key} = ${ga4_items.join_key} ;;
    relationship: many_to_one
  }

  # Join with ga4_events_params
  join: ga4_events_params {
    type: left_outer
    sql_on: ${ga4_user_properties.join_key} = ${ga4_events_params.join_key} ;;
    relationship: many_to_one
  }
}
