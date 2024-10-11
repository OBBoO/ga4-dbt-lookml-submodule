connection: "ga4_dbt_lkml_project"

include: "/views/*"

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
