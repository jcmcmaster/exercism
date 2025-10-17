import gleam/list
import gleam/set

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  keep_rec(list, predicate, [])
}

fn keep_rec(in, pred, out) {
  case in {
    [] -> out |> list.reverse
    [head, ..tail] ->
      case pred(head) {
        True -> keep_rec(tail, pred, [head, ..out])
        False -> keep_rec(tail, pred, out)
      }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  discard_rec(list, predicate, [])
}

fn discard_rec(in, pred, out) {
  case in {
    [] -> out |> list.reverse
    [head, ..tail] ->
      case pred(head) {
        True -> discard_rec(tail, pred, out)
        False -> discard_rec(tail, pred, [head, ..out])
      }
  }
}
