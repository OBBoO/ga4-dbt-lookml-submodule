connection: "ga4_dbt_lkml_project"

include: "/views/*"

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
