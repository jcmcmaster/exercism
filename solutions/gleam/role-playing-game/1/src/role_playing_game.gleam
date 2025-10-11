import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(n) -> n
    None -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    p if p.health <= 0 -> {
      let mana = case p.level {
        l if l >= 10 -> Some(100)
        _ -> p.mana
      }
      Some(Player(..p, health: 100, mana: mana))
    }
    _ -> None
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  let damage = cost * 2
  let health = player.health - cost |> int.max(0)
  case player.mana {
    None -> #(Player(..player, health: health), 0)
    Some(m) if m < cost -> #(player, 0)
    Some(m) -> #(Player(..player, mana: Some(m - cost)), damage)
  }
}
