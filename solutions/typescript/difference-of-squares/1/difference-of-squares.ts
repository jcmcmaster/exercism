export class Squares {
  private count: number

  constructor(count: number) {
    this.count = count
  }

  get sumOfSquares(): number {
    return [...Array(this.count).keys()]
      .map(i => (i + 1) ** 2)
      .reduce((prev, cur) => prev + cur, 0)
  }

  get squareOfSum(): number {
    return [...Array(this.count).keys()]
      .map(i => i + 1)
      .reduce((prev, cur) => prev + cur, 0) ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }
}
