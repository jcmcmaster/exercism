import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> to_matrix
  |> result.try(at(_, index - 1))
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  string
  |> to_matrix
  |> result.map(list.transpose)
  |> result.try(at(_, index - 1))
}

fn to_matrix(string) {
  string
  |> string.split("\n")
  |> list.map(fn(s) {
    s
    |> string.trim
    |> string.split(" ")
    |> list.map(int.parse)
    |> result.all
  })
  |> result.all
}

fn at(xs, index) {
  case xs, index {
    _, i if i < 0 -> Error(Nil)
    [], _ -> Error(Nil)
    [found, ..], 0 -> Ok(found)
    [_, ..rest], _ -> at(rest, index - 1)
  }
}
