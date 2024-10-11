connection: "ga4_dbt_lkml_project"

include: "/views/*"

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
