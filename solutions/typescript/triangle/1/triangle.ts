export class Triangle {
  sides: number[]
  totalLength: number

  constructor(...sides: number[]) {
    this.sides = sides
    this.totalLength = sides.reduce((a, b) => a + b, 0)
  }

  get isTriangle(): boolean {
    return this.sides.every(x => x > 0 && this.totalLength - x >= x)
  }

  get isEquilateral(): boolean {
    return this.isTriangle && new Set(this.sides).size === 1
  }

  get isIsosceles(): boolean {
    return this.isTriangle && new Set(this.sides).size <= 2
  }

  get isScalene(): boolean {
    return this.isTriangle && new Set(this.sides).size === 3
  }
}
