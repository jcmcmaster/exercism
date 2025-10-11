export class DnDCharacter {
  constructor() {
    this.strength = DnDCharacter.generateAbilityScore()
    this.dexterity = DnDCharacter.generateAbilityScore()
    this.constitution = DnDCharacter.generateAbilityScore()
    this.intelligence = DnDCharacter.generateAbilityScore()
    this.wisdom = DnDCharacter.generateAbilityScore()
    this.charisma = DnDCharacter.generateAbilityScore()

    // calculate initial hitpoints
    this.hitpoints = 10 + DnDCharacter.getModifierFor(this.constitution)
  }

  public static generateAbilityScore(): number {
    const rolls = [...Array(4)]
      .map(_ => Math.floor(Math.random() * 5 + 1))
    return rolls
      .sort((a, b) => a - b)
      .slice(0, 3)
      .reduce((x, y) => x + y, 0)
  }

  public static getModifierFor(abilityValue: number): number {
    return Math.floor((abilityValue - 10) / 2)
  }

  public strength: number
  public dexterity: number
  public constitution: number
  public intelligence: number
  public wisdom: number
  public charisma: number
  public hitpoints: number
}
