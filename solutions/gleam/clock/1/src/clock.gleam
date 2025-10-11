import gleam/int
import gleam/list
import gleam/string

pub type Clock {
  Clock(minutes: Int)
}

const mins_per_day = 1440

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  case { hour * 60 + minute } % { 60 * 24 } {
    m if m < 0 -> mins_per_day + m
    m -> m
  }
  |> Clock
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  clock.minutes + minutes
  |> create(0, _)
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  clock.minutes - minutes
  |> create(0, _)
}

pub fn display(clock: Clock) -> String {
  [clock.minutes / 60, clock.minutes % 60]
  |> list.map(int.to_string)
  |> list.map(string.pad_start(_, 2, "0"))
  |> string.join(":")
}
