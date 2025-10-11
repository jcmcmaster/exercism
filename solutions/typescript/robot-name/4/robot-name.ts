export class Robot {
  static namesInUse: Set<string> = new Set<string>

  #name: string = ""

  constructor() {
    this.applyName()
  }

  public get name(): string {
    return this.#name
  }

  public resetName(): void {
    this.applyName()
  }

  public static releaseNames(): void {
    Robot.namesInUse.clear()
  }

  getName(): string {
    let letters: string = ""

    for (let i = 0; i < 2; i++)
      letters += String.fromCharCode(Math.floor(Math.random() * 26) + 65)

    const numbers: string = ("000" + Math.floor(Math.random() * 1000)).slice(-3)

    return letters + numbers
  }

  applyName(): void {
    let newName: string = ""

    do {
      newName = this.getName()
    } while (Robot.namesInUse.has(newName))
    Robot.namesInUse.add(newName)

    this.#name = newName
  }
}
