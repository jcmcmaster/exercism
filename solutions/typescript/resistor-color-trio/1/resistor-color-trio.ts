enum ResistorValue {
  black = 0,
  brown = 1,
  red = 2,
  orange = 3,
  yellow = 4,
  green = 5,
  blue = 6,
  violet = 7,
  grey = 8,
  white = 9,
}

type Color = keyof typeof ResistorValue

let prefixes = [
  "",
  "kilo",
  "mega",
  "giga",
  "tera",
  "peta",
  "exa"
]

export function decodedResistorValue([color1, color2, color3]: Color[]) {
  let unmultipliedOhms = ResistorValue[color1] * 10 + ResistorValue[color2]
  let ohms = unmultipliedOhms * 10 ** ResistorValue[color3]
  return bundle(ohms)
}

const bundle = (ohms: number): string => {
  let counter = 0
  while (ohms > 1000) {
    ohms /= 1000
    counter++
  }
  return `${ohms} ${prefixes[counter]}ohms`
}

