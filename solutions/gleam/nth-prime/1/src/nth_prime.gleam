pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    n if n <= 0 -> Error(Nil)
    _ -> Ok(get_nth_prime_recurse(2, 0, number))
  }
}

fn get_nth_prime_recurse(cur, count, target) {
  case is_prime(cur), count, target {
    True, c, t if c + 1 == t -> cur
    True, _, _ -> get_nth_prime_recurse(cur + 1, count + 1, target)
    False, _, _ -> get_nth_prime_recurse(cur + 1, count, target)
  }
}

fn is_prime(number) {
  case number {
    i if i < 2 -> False
    i if i == 2 -> True
    i if i % 2 == 0 -> False
    _ -> is_prime_recurse(number, 3)
  }
}

fn is_prime_recurse(number, divisor) {
  case divisor * divisor > number {
    True -> True
    False ->
      case number % divisor == 0 {
        True -> False
        False -> is_prime_recurse(number, divisor + 2)
      }
  }
}
