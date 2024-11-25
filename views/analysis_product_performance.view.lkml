
view: analysis_product_performance {
  derived_table: {
  sql:  SELECT
    ga4_items.item_name  AS item_name,
    ga4_items.item_id  AS item_id,
    COUNT(CASE WHEN (( ga4_items.event_name  ) LIKE 'view_item') THEN 1 ELSE NULL END) AS ga4_items_total_product_views,
    COUNT(CASE WHEN (( ga4_items.event_name  ) LIKE 'add_to_cart') THEN 1 ELSE NULL END) AS ga4_items_total_product_add_to_carts,
    SAFE_DIVIDE(COUNT(CASE WHEN (( ga4_items.event_name  ) LIKE 'add_to_cart') THEN 1 ELSE NULL END), COUNT(CASE WHEN (( ga4_items.event_name  ) LIKE 'view_item') THEN 1 ELSE NULL END)) AS ga4_items_product_atc_rate,
    COUNT(CASE WHEN (( ga4_items.event_name  ) = 'purchase') THEN 1 ELSE NULL END) AS ga4_items_total_product_purchases,
    SAFE_DIVIDE(COUNT(CASE WHEN (( ga4_items.event_name  ) = 'purchase') THEN 1 ELSE NULL END), COUNT(CASE WHEN (( ga4_items.event_name  ) LIKE 'view_item') THEN 1 ELSE NULL END)) AS ga4_items_product_conversion_rate
FROM converteo-training-looker.ga4_dbt_lkml_project.ga4_items  AS ga4_items
WHERE ga4_items.item_id <> "(not set)"
GROUP BY
    1,
    2
ORDER BY
    ga4_items_total_product_purchases DESC
;;
  }
  dimension: ga4_items_total_product_views {
    description: ""
    type: number
  }
  dimension: ga4_items_total_product_add_to_carts {
    description: ""
    type: number
  }
  dimension: ga4_items_product_atc_rate {
    description: ""
    value_format: "0.00%"
    type: number
  }
  dimension: ga4_items_total_product_purchases {
    description: ""
    type: number
  }
  dimension: ga4_items_product_conversion_rate {
    description: ""
    value_format: "0.00%"
    type: number
  }
  dimension: item_name {
    description: "Name of the item involved in the event."
  }
  dimension: item_id {
    description: "ID of the item involved in the event."
  }
  }


# # Define your dimensions and measures here, like this:
# dimension: user_id {
#   description: "Unique ID for each user that has ordered"
#   type: number
#   sql: ${TABLE}.user_id ;;
# }
#
# dimension: lifetime_orders {
#   description: "The total number of orders for each user"
#   type: number
#   sql: ${TABLE}.lifetime_orders ;;
# }
#
# dimension_group: most_recent_purchase {
#   description: "The date when each user last ordered"
#   type: time
#   timeframes: [date, week, month, year]
#   sql: ${TABLE}.most_recent_purchase_at ;;
# }
#
# measure: total_lifetime_orders {
#   description: "Use this for counting lifetime orders across many users"
#   type: sum
#   sql: ${lifetime_orders} ;;
# }


# view: analysis_product_performance {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
