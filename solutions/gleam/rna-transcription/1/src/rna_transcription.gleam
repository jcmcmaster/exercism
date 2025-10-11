import gleam/list
import gleam/result
import gleam/string

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> string.to_graphemes
  |> list.map(dna_ntide_to_rna_ntide)
  |> result.all
  |> result.map(string.concat)
}

fn dna_ntide_to_rna_ntide(s) {
  case string.uppercase(s) {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}
