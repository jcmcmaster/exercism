export class Matrix {
  matrix: number[][]
  constructor(input: string) {
    this.matrix = []
    input.split("\n").forEach(l =>
      this.matrix.push(
        l.split(" ").map(n => Number(n))))
  }

  get rows(): number[][] {
    return this.matrix
  }

  get columns(): number[][] {
    const newMatrix: number[][] = []
    for (let i = 0; i < this.matrix[0].length; i++) { // for each column
      const col: number[] = []
      for (let j = 0; j < this.matrix.length; j++) { // for each row
        col.push(this.matrix[j][i])
      }
      newMatrix.push(col)
    }
    return newMatrix
  }
}
