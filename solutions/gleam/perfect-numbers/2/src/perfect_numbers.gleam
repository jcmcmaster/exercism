import gleam/bool
import gleam/int
import gleam/order

pub type Classification {
  Perfect
  Abundant
  Deficient
}

pub type Error {
  NonPositiveInt
}

pub fn classify(number: Int) -> Result(Classification, Error) {
  use <- bool.guard(number <= 0, Error(NonPositiveInt))

  let aliquot = aliquot(number, 1, 0)

  case int.compare(aliquot, number) {
    order.Lt -> Deficient
    order.Eq -> Perfect
    order.Gt -> Abundant
  }
  |> Ok
}

fn aliquot(number, factor, sum) {
  case factor * 2 > number {
    True -> sum
    False -> {
      case number % factor {
        0 -> aliquot(number, factor + 1, sum + factor)
        _ -> aliquot(number, factor + 1, sum)
      }
    }
  }
}
