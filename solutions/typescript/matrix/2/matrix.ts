export class Matrix {
  rowProjection: number[][]
  columnProjection: number[][]

  constructor(input: string) {
    // create rows projection
    this.rowProjection = []
    this.columnProjection = []
    input.split("\n").forEach(l =>
      this.rowProjection.push(
        l.split(" ").map(n => Number(n))))

    // create columns projection
    for (let i = 0; i < this.rowProjection[0].length; i++) { // for each column
      const col: number[] = []
      for (let j = 0; j < this.rowProjection.length; j++) { // for each row
        col.push(this.rowProjection[j][i])
      }
      this.columnProjection.push(col)
    }
  }

  get rows(): number[][] {
    return this.rowProjection
  }

  get columns(): number[][] {
    return this.columnProjection
  }
}
