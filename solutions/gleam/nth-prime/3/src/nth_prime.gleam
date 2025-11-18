import gleam/list

pub fn prime(number: Int) -> Result(Int, Nil) {
  case number {
    n if n <= 0 -> Error(Nil)
    1 -> Ok(2)
    2 -> Ok(3)
    _ -> recurse(5, [2, 3], number)
  }
}

fn recurse(candidate, primes, n) {
  case list.length(primes) == n {
    True -> list.first(primes)
    False ->
      case list.all(primes, fn(p) { candidate % p != 0 }) {
        True -> recurse(candidate + 2, [candidate, ..primes], n)
        False -> recurse(candidate + 2, primes, n)
      }
  }
}
