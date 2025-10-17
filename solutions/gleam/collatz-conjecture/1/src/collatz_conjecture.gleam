pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    n if n <= 0 -> Error(NonPositiveNumber)
    _ -> Ok(steps_rec(number, 0))
  }
}

fn steps_rec(number, count) {
  case number {
    1 -> count
    n if n % 2 == 0 -> steps_rec(number / 2, count + 1)
    _ -> steps_rec(number * 3 + 1, count + 1)
  }
}
