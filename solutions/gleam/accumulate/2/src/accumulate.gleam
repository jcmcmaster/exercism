import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  accumulate_rec(list, fun, [])
}

fn accumulate_rec(collection, fun, acc) {
  case collection {
    [] -> acc
    [head, ..tail] -> accumulate_rec(tail, fun, list.append(acc, [fun(head)]))
  }
}
