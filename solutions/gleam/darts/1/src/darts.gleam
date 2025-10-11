import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  let distance = float.square_root(x *. x +. y *. y)

  case distance {
    Error(_) -> 0
    Ok(d) if d >. 10.0 -> 0
    Ok(d) if d >. 5.0 -> 1
    Ok(d) if d >. 1.0 -> 5
    _ -> 10
  }
}
