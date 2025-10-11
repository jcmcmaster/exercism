pub fn convert(number: Int) -> String {
  convert_rec(number, "")
}

fn convert_rec(number: Int, acc: String) {
  case number {
    n if n <= 0 -> acc
    n -> {
      let #(arabian, roman) = get_nearest_numeral(n)
      convert_rec(n - arabian, acc <> roman)
    }
  }
}

fn get_nearest_numeral(number) {
  case number {
    n if n >= 1000 -> #(1000, "M")
    n if n >= 900 -> #(900, "CM")
    n if n >= 500 -> #(500, "D")
    n if n >= 400 -> #(400, "CD")
    n if n >= 100 -> #(100, "C")
    n if n >= 90 -> #(90, "XC")
    n if n >= 50 -> #(50, "L")
    n if n >= 40 -> #(40, "XL")
    n if n >= 10 -> #(10, "X")
    n if n >= 9 -> #(9, "IX")
    n if n >= 5 -> #(5, "V")
    n if n >= 4 -> #(4, "IV")
    n if n >= 1 -> #(1, "I")
    _ -> #(0, "")
  }
}
