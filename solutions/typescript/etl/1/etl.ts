type OldShape = { [key: string]: string[] }
type NewShape = { [key: string]: number }

export function transform(old: OldShape): NewShape {
  const newObj: NewShape = {}

  for (let [value, letters] of Object.entries(old)) {
    for (let letter of letters) {
      newObj[letter.toLowerCase()] = Number(value)
    }
  }

  return newObj
}
