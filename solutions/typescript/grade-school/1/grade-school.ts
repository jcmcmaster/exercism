export class GradeSchool {
  #roster = new Map<number, string[]>()

  roster(): { [key: number]: string[] } {
    const result = Object.fromEntries(this.#roster.entries())
    for (let grade in result) {
      result[grade].sort()
    }
    return JSON.parse(JSON.stringify(result))
  }

  add(name: string, grade: number): void {
    this.#roster.forEach(g => {
      let nameIndex = g.indexOf(name)
      if (nameIndex > -1)
        g.splice(nameIndex, 1)
    })

    if (!this.#roster.has(grade))
      this.#roster.set(grade, [])

    this.#roster.set(grade, [...this.#roster.get(grade) ?? [], name])
  }

  grade(gradeNumber: number): string[] {
    return JSON.parse(JSON.stringify(this.#roster.get(gradeNumber)?.sort() ?? []))
  }
}
