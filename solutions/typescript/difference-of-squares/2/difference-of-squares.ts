export class Squares {
  constructor(private count: number) { }

  get sumOfSquares(): number {
    return [...Array(this.count).keys()]
      .map(i => (i + 1) ** 2)
      .reduce((acc, cur) => acc + cur)
  }

  get squareOfSum(): number {
    return [...Array(this.count).keys()]
      .map(i => i + 1)
      .reduce((acc, cur) => acc + cur) ** 2
  }

  get difference(): number {
    return this.squareOfSum - this.sumOfSquares
  }
}
