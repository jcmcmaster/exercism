import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.from_list([card])
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  case set.contains(collection, card) {
    True -> #(True, collection)
    False -> #(False, collection |> set.insert(card))
  }
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  let after = collection |> set.insert(their_card) |> set.delete(my_card)
  case set.contains(collection, my_card), set.contains(collection, their_card) {
    True, False -> #(True, after)
    _, _ -> #(False, after)
  }
}

fn all_cards(collections) {
  collections
  |> list.reduce(fn(acc, cur) { set.union(acc, cur) })
  |> result.unwrap(set.new())
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.fold(all_cards(collections), fn(acc, s) { set.intersection(acc, s) })
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), fn(acc, s) { set.union(acc, s) })
  |> set.size
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection
  |> set.filter(fn(card) { card |> string.starts_with("Shiny ") })
}
