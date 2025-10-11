import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

fn pizza_price_rec(pizza, acc) {
  case pizza {
    Margherita -> 7 + acc
    Caprese -> 9 + acc
    Formaggio -> 10 + acc
    ExtraSauce(p) -> pizza_price_rec(p, 1 + acc)
    ExtraToppings(p) -> pizza_price_rec(p, 2 + acc)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base = order_price_rec(order, 0)
  case list.length(order) {
    1 -> base + 3
    2 -> base + 2
    _ -> base
  }
}

fn order_price_rec(order, accumulator) {
  case order {
    [] -> accumulator
    [head, ..tail] -> order_price_rec(tail, accumulator + pizza_price(head))
  }
}
