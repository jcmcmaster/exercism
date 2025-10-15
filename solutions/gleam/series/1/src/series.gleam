import gleam/list
import gleam/result
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  use _ <- result.try(validate_input(input, size))

  slices_recurse(input, size, [])
  |> list.reverse
  |> Ok
}

fn slices_recurse(input, slice_size, acc) {
  let input_length = string.length(input)
  case input_length, slice_size {
    _, _ if slice_size > input_length -> acc
    _, _ -> {
      let new_slice = input |> string.slice(0, slice_size)
      let new_input = string.drop_start(input, 1)
      slices_recurse(new_input, slice_size, [new_slice, ..acc])
    }
  }
}

fn validate_input(input, size) -> Result(Nil, Error) {
  let len = string.length(input)

  case input, size {
    _, _ if input == "" -> Error(EmptySeries)
    _, _ if size > len -> Error(SliceLengthTooLarge)
    _, _ if size == 0 -> Error(SliceLengthZero)
    _, _ if size < 0 -> Error(SliceLengthNegative)
    _, _ -> Ok(Nil)
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
