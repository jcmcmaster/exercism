import gleam/list
import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(content) = problem
  content
}

pub fn remove_team_prefix(team: String) -> String {
  string.replace(team, "Team ", "")
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let parts =
    combined
    |> string.split(",")
    |> list.map(remove_team_prefix)
  let assert [a, b] = parts
  #(a, b)
}
