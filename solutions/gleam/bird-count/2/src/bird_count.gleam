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
  case days {
    [] -> False
    [d, ..] if d == 0 -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [d, ..rest] -> d + total(rest)
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [d, ..rest] if d >= 5 -> 1 + busy_days(rest)
    [d, ..rest] -> busy_days(rest)
  }
}
