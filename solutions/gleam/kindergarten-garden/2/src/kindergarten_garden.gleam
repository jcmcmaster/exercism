import gleam/list
import gleam/result
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  diagram
  |> string.split("\n")
  |> list.flat_map(fn(row) {
    row
    |> string.slice(student_to_position(student) * 2, 2)
    |> string.to_graphemes
    |> list.map(letter_to_plant)
  })
  |> result.values
}

fn letter_to_plant(letter) {
  case letter {
    "C" -> Ok(Clover)
    "G" -> Ok(Grass)
    "R" -> Ok(Radishes)
    "V" -> Ok(Violets)
    _ -> Error(Nil)
  }
}

fn student_to_position(student) {
  case student {
    Alice -> 0
    Bob -> 1
    Charlie -> 2
    David -> 3
    Eve -> 4
    Fred -> 5
    Ginny -> 6
    Harriet -> 7
    Ileana -> 8
    Joseph -> 9
    Kincaid -> 10
    Larry -> 11
  }
}
