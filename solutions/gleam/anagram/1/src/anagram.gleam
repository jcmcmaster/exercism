import gleam/list
import gleam/string

fn is_anagram(word, candidate) {
  let normalize = fn(word) {
    word
    |> string.lowercase
    |> string.to_graphemes()
    |> list.sort(by: string.compare)
  }
  string.lowercase(word) != string.lowercase(candidate)
  && normalize(word) == normalize(candidate)
}

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  candidates
  |> list.filter(fn(candidate) { is_anagram(word, candidate) })
}
