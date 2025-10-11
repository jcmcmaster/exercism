import gleam/dict.{type Dict}
import gleam/list
import gleam/string

pub fn transform(legacy: Dict(Int, List(String))) -> Dict(String, Int) {
  dict.fold(legacy, dict.new(), fn(acc, key, value) {
    list.fold(value, acc, fn(acc, char) {
      dict.insert(acc, string.lowercase(char), key)
    })
  })
}
