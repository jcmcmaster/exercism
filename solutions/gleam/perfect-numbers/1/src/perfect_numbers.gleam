import gleam/bool
import gleam/float
import gleam/int
import gleam/order
import gleam/result

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
  use <- bool.guard(number == 1, Ok(Deficient))
  let assert Ok(sum) = aliquot_sum(number)
  case int.compare(number, sum) {
    order.Gt -> Deficient
    order.Eq -> Perfect
    order.Lt -> Abundant
  }
  |> Ok
}

fn aliquot_sum(num) {
  use ints <- result.map(factors(num))
  ints |> int.sum
}

fn factors(num: Int) {
  use sqrtf <- result.map(int.square_root(num))
  let sqrti = sqrtf |> float.round
  factors_rec(num, 1, sqrti, [])
}

fn factors_rec(num, factor1, target, acc) {
  use <- bool.guard(factor1 > target, acc)
  case num % factor1 == 0 {
    True -> {
      let factor2 = num / factor1
      case factor2 == factor1 || factor1 == 1 {
        True -> factors_rec(num, factor1 + 1, target, [factor1, ..acc])
        False ->
          factors_rec(num, factor1 + 1, target, [factor2, factor1, ..acc])
      }
    }
    False -> factors_rec(num, factor1 + 1, target, acc)
  }
}
