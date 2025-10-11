fn is_triangle(a, b, c) {
  case a, b, c {
    a, b, c
      if a >. 0.0
      && b >. 0.0
      && c >. 0.0
      && a +. b >=. c
      && b +. c >=. a
      && c +. a >=. b
    -> True
    _, _, _ -> False
  }
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a == b && b == c && c == a
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && { a == b || b == c || c == a }
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  is_triangle(a, b, c) && a != b && b != c && c != a
}
