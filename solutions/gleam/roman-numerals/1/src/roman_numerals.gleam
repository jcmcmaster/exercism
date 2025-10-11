import gleam/string

fn get_nearest_numeral_number(number) {
  case number {
    _ if number >= 1000 -> 1000
    _ if number >= 500 -> 500
    _ if number >= 100 -> 100
    _ if number >= 50 -> 50
    _ if number >= 10 -> 10
    _ if number >= 5 -> 5
    _ if number >= 1 -> 1
    _ -> 0
  }
}

fn get_numeral(number) {
  case number {
    _ if number >= 1000 -> "M"
    _ if number >= 500 -> "D"
    _ if number >= 100 -> "C"
    _ if number >= 50 -> "L"
    _ if number >= 10 -> "X"
    _ if number >= 5 -> "V"
    _ if number >= 1 -> "I"
    _ -> ""
  }
}

fn simplify(raw) {
  raw
  |> string.replace("DCCCC", "CM")
  |> string.replace("CCCC", "CD")
  |> string.replace("LXXXX", "XC")
  |> string.replace("XXXX", "XL")
  |> string.replace("VIIII", "IX")
  |> string.replace("IIII", "IV")
}

pub fn convert(number: Int) -> String {
  convert_rec(number, "")
  |> simplify
}

pub fn convert_rec(number: Int, acc: String) {
  case number {
    _ if number <= 0 -> acc
    _ ->
      convert_rec(
        number - get_nearest_numeral_number(number),
        acc <> get_numeral(number),
      )
  }
}
