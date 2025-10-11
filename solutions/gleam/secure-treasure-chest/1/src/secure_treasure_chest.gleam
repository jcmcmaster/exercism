import gleam/string

pub opaque type TreasureChest(t) {
  TreasureChest(password: String, treasure: t)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) {
    l if l < 8 -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password: password, treasure: contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    True -> Ok(chest.treasure)
    _ -> Error("Incorrect password")
  }
}
