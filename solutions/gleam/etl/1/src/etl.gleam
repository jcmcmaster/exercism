import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.fold(legacy, dict.new(), fn(acc, key, value) {
    value
    |> list.map(fn(char) { #(string.lowercase(char), key) })
    |> dict.from_list
    |> dict.merge(acc)
  })
}
