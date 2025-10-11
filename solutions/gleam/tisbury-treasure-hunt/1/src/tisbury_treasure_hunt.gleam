import gleam/list

pub fn place_location_to_treasure_location(
  place_location: #(String, Int),
) -> #(Int, String) {
  let #(letter, number) = place_location
  #(number, letter)
}

pub fn treasure_location_matches_place_location(
  place_location: #(String, Int),
  treasure_location: #(Int, String),
) -> Bool {
  place_location_to_treasure_location(place_location) == treasure_location
}

pub fn count_place_treasures(
  place: #(String, #(String, Int)),
  treasures: List(#(String, #(Int, String))),
) -> Int {
  treasures
  |> list.count(fn(treasure) {
    treasure_location_matches_place_location(place.1, treasure.1)
  })
}

pub fn special_case_swap_possible(
  found_treasure: #(String, #(Int, String)),
  place: #(String, #(String, Int)),
  desired_treasure: #(String, #(Int, String)),
) -> Bool {
  case found_treasure.0, desired_treasure.0, place.0 {
    "Brass Spyglass", _, "Abandoned Lighthouse" -> True
    "Amethyst Octopus", dt, "Stormy Breakwater"
      if dt == "Crystal Crab" || dt == "Glass Starfish"
    -> True
    "Vintage Pirate Hat", dt, "Harbor Managers Office"
      if dt == "Model Ship in Large Bottle"
      || dt == "Antique Glass Fishnet Float"
    -> True
    _, _, _ -> False
  }
}
