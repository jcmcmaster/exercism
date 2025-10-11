export class Triangle {
  readonly sides: number[]
  readonly totalLength: number
  readonly isValid: boolean

  constructor(...sides: number[]) {
    this.sides = sides
    this.totalLength = sides.reduce((a, b) => a + b, 0)
    this.isValid = this.sides.every(x => x > 0 && this.totalLength - x >= x)
  }

  get isEquilateral(): boolean {
    return this.isValid && new Set(this.sides).size === 1
  }

  get isIsosceles(): boolean {
    return this.isValid && new Set(this.sides).size <= 2
  }

  get isScalene(): boolean {
    return this.isValid && new Set(this.sides).size === 3
  }
}
