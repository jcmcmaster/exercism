import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.map(encode_nucleotide)
  |> list.fold(from: <<>>, with: fn(acc, i) { <<acc:bits, i:size(2)>> })
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  do_decode([], dna)
}

fn do_decode(acc, dna) {
  case dna {
    <<>> -> Ok(acc |> list.reverse)
    <<value:2, rest:bits>> ->
      result.try(decode_nucleotide(value), fn(n) { do_decode([n, ..acc], rest) })
    _ -> Error(Nil)
  }
}
