view: ga4_items {
  sql_table_name: converteo-training-looker.ga4_dbt_lkml_project.ga4_items ;;

  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
    description: "Pseudo user ID associated with the event."
  }

  dimension: event_timestamp {
    type: number
    sql: ${TABLE}.event_timestamp ;;
    description: "Timestamp of the event."
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
    description: "Name of the event."
  }

  dimension: item_id {
    type: string
    sql: ${TABLE}.item_id ;;
    description: "ID of the item involved in the event."
  }

  dimension: item_name {
    type: string
    sql: ${TABLE}.item_name ;;
    description: "Name of the item involved in the event."
  }

  dimension: item_brand {
    type: string
    sql: ${TABLE}.item_brand ;;
    description: "Brand of the item involved in the event."
  }

  dimension: item_variant {
    type: string
    sql: ${TABLE}.item_variant ;;
    description: "Variant of the item involved in the event."
  }

  dimension: item_category {
    type: string
    sql: ${TABLE}.item_category ;;
    description: "Main category of the item."
  }

  dimension: item_category2 {
    type: string
    sql: ${TABLE}.item_category2 ;;
    description: "Secondary category of the item."
  }

  dimension: item_category3 {
    type: string
    sql: ${TABLE}.item_category3 ;;
    description: "Tertiary category of the item."
  }

  dimension: item_category4 {
    type: string
    sql: ${TABLE}.item_category4 ;;
    description: "Fourth category of the item."
  }

  dimension: item_category5 {
    type: string
    sql: ${TABLE}.item_category5 ;;
    description: "Fifth category of the item."
  }

  dimension: price_in_usd {
    type: number
    sql: ${TABLE}.price_in_usd ;;
    description: "Price of the item in USD."
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
    description: "Price of the item in the local currency."
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
    description: "Quantity of the item involved in the event."
  }

  dimension: item_revenue_in_usd {
    type: number
    sql: ${TABLE}.item_revenue_in_usd ;;
    description: "Revenue generated by the item in USD."
  }

  dimension: item_revenue {
    type: number
    sql: ${TABLE}.item_revenue ;;
    description: "Revenue generated by the item in the local currency."
  }

  dimension: item_refund_in_usd {
    type: number
    sql: ${TABLE}.item_refund_in_usd ;;
    description: "Refund value for the item in USD."
  }

  dimension: item_refund {
    type: number
    sql: ${TABLE}.item_refund ;;
    description: "Refund value for the item in the local currency."
  }

  dimension: coupon {
    type: string
    sql: ${TABLE}.coupon ;;
    description: "Coupon applied to the item."
  }

  dimension: affiliation {
    type: string
    sql: ${TABLE}.affiliation ;;
    description: "Affiliation of the item in the event."
  }

  dimension: location_id {
    type: string
    sql: ${TABLE}.location_id ;;
    description: "Location ID associated with the item."
  }

  dimension: item_list_id {
    type: string
    sql: ${TABLE}.item_list_id ;;
    description: "ID of the item list from which the item was selected."
  }

  dimension: item_list_name {
    type: string
    sql: ${TABLE}.item_list_name ;;
    description: "Name of the item list from which the item was selected."
  }

  dimension: item_list_index {
    type: string
    sql: ${TABLE}.item_list_index ;;
    description: "Index of the item in the item list."
  }

  dimension: promotion_id {
    type: string
    sql: ${TABLE}.promotion_id ;;
    description: "ID of the promotion associated with the item."
  }

  dimension: promotion_name {
    type: string
    sql: ${TABLE}.promotion_name ;;
    description: "Name of the promotion associated with the item."
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
    description: "Creative name for the item."
  }

  dimension: creative_slot {
    type: string
    sql: ${TABLE}.creative_slot ;;
    description: "Creative slot where the item was shown."
  }

  dimension: join_key {
    type: string
    sql: ${TABLE}.join_key ;;
    description: "Join key created by concatenating user_pseudo_id, event_timestamp, event_name, and dedup_id."
  }
}