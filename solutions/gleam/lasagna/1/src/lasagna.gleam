pub fn expected_minutes_in_oven() {
  40
}

pub fn remaining_minutes_in_oven(mins_already_in) {
  expected_minutes_in_oven() - mins_already_in
}

pub fn preparation_time_in_minutes(layers) {
  2 * layers
}

pub fn total_time_in_minutes(layers, mins_already_in) {
  preparation_time_in_minutes(layers) + mins_already_in
}

pub fn alarm() {
  "Ding!"
}
