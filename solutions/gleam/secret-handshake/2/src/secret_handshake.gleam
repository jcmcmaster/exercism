import gleam/int
import gleam/list

pub type Command {
  Wink
  DoubleBlink
  CloseYourEyes
  Jump
}

pub fn commands(encoded_message: Int) -> List(Command) {
  let commands =
    [#(Jump, 8), #(CloseYourEyes, 4), #(DoubleBlink, 2), #(Wink, 1)]
    |> list.fold([], fn(acc, pair) {
      case int.bitwise_and(pair.1, encoded_message) {
        0 -> acc
        _ -> [pair.0, ..acc]
      }
    })

  case int.bitwise_and(encoded_message, 16) {
    16 -> list.reverse(commands)
    _ -> commands
  }
}
