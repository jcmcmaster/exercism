import gleam/bool
import gleam/int
import gleam/io
import gleam/list
import gleam/option.{type Option, None, Some}
import gleam/result
import gleam/string

pub fn row(index: Int, string: String) -> Result(List(Int), Nil) {
  let rows = string |> string.split("\n")
  use <- bool.guard(list.length(rows) < index, Error(Nil))
  list.index_fold(rows, "", fn(_, cur, index) {
    case index {
      i if i == index -> cur
      _ -> ""
    }
  })
  |> string.trim
  |> string.split(" ")
  |> list.map(int.parse)
  |> result.all
}

pub fn column(index: Int, string: String) -> Result(List(Int), Nil) {
  let matrix_result =
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

  use matrix <- result.try(matrix_result)

  let transposed = list.transpose(matrix)

  use <- bool.guard(index > list.length(transposed), Error(Nil))

  list.index_fold(transposed, None, fn(acc, cur, idx) {
    case acc, idx + 1 == index {
      Some(_), _ -> acc
      None, True -> Some(cur)
      _, _ -> None
    }
  })
  |> option.unwrap([])
  |> Ok
}
