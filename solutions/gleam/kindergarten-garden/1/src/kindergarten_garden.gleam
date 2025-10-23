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
  let plants =
    diagram
    |> string.uppercase
    |> string.to_graphemes
    |> list.map(fn(g) {
      case g {
        "C" -> Ok(Clover)
        "G" -> Ok(Grass)
        "R" -> Ok(Radishes)
        "V" -> Ok(Violets)
        _ -> Error(Nil)
      }
    })
    |> result.values

  plants
  |> list.index_fold([], fn(acc, x, i) {
    case
      list.contains(student_to_positions(student, list.length(plants) / 2), i)
    {
      True -> [x, ..acc]
      _ -> acc
    }
  })
  |> list.reverse
}

fn student_to_positions(student, length) {
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
  |> fn(i) { [i * 2, i * 2 + 1, i * 2 + length, i * 2 + length + 1] }
}
