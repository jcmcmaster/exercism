import gleam/bool
import gleam/dict
import gleam/list
import gleam/result
import gleam/string

pub type School {
  School(grades: dict.Dict(Int, List(String)))
}

pub fn create() -> School {
  School(dict.from_list([]))
}

pub fn roster(school: School) -> List(String) {
  school.grades
  |> dict.map_values(fn(_, v) { list.sort(v, string.compare) })
  |> dict.values
  |> list.flatten
}

pub fn add(
  to school: School,
  student student: String,
  grade grade: Int,
) -> Result(School, Nil) {
  use <- bool.guard(is_student_rostered(school, student), Error(Nil))

  dict.get(school.grades, grade)
  |> result.unwrap([])
  |> list.prepend(student)
  |> dict.insert(school.grades, grade, _)
  |> School
  |> Ok
}

fn is_student_rostered(school, student) {
  roster(school)
  |> list.contains(student)
}

pub fn grade(school: School, desired_grade: Int) -> List(String) {
  school.grades
  |> dict.get(desired_grade)
  |> result.unwrap([])
}
