import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health, player.level {
    0, l if l >= 10 -> Some(Player(..player, health: 100, mana: Some(100)))
    0, _ -> Some(Player(..player, health: 100))
    _, _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana, cost {
    None, _ -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
    Some(m), c if m < c -> #(player, 0)
    Some(m), c -> #(Player(..player, mana: Some(m - c)), c * 2)
  }
}
