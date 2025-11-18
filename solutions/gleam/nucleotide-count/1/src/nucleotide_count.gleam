import gleam/dict.{type Dict}
import gleam/list
import gleam/result
import gleam/string

const significant_proteins = ["A", "C", "G", "T"]

pub fn nucleotide_count(dna: String) -> Result(Dict(String, Int), Nil) {
  dna
  |> string.uppercase
  |> string.to_graphemes
  |> list.map(fn(g) {
    case list.contains(significant_proteins, g) {
      True -> Ok(g)
      False -> Error(Nil)
    }
  })
  |> result.all
  |> result.map(fn(list) {
    let defaults =
      significant_proteins
      |> list.map(fn(sp) { #(sp, 0) })
      |> dict.from_list

    list
    |> list.group(by: fn(x) { x })
    |> dict.map_values(with: fn(_, x) { list.length(x) })
    |> dict.merge(defaults, _)
  })
}
