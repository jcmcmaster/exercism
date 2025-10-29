import gleam/bool
import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  let rows = string |> string.split("\n")
  use <- bool.guard(list.length(rows) < index, Error(Nil))
  list.index_fold("", fn(acc, cur, index) {
    case index {
      i if i == index -> cur
      _ -> ""
    }
  })
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  todo
}

fn string_to_matrix(string) {
  string
  |> string.split("\n")
  |> list.map(string.split(_, " "))
  |> list.map(list.map(_, int.parse))
  |> list.map(result.all)
  |> result.all
}
