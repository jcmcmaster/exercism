import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn to_price(pizza) {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(_) -> 1
    ExtraToppings(_) -> 2
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_rec(pizza, 0)
}

fn pizza_price_rec(pizza, accumulator) {
  case pizza {
    ExtraSauce(p) -> pizza_price_rec(p, accumulator + to_price(pizza))
    ExtraToppings(p) -> pizza_price_rec(p, accumulator + to_price(pizza))
    p -> accumulator + to_price(p)
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
    [head, ..rest] -> order_price_rec(rest, accumulator + pizza_price(head))
  }
}
