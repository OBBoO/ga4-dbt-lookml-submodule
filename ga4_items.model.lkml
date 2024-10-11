connection: "ga4_dbt_lkml_project"

include: "/views/*"

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
