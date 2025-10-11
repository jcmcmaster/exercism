import gleam/int
import gleam/list

pub fn today(days: List(Int)) -> Int {
  case days {
    [t, ..] -> t
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [t, ..rest] -> [t + 1, ..rest]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  days |> list.any(fn(d) { d == 0 })
}

pub fn total(days: List(Int)) -> Int {
  int.sum(days)
}

pub fn busy_days(days: List(Int)) -> Int {
  days |> list.count(fn(d) { d >= 5 })
}
