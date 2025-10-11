const DnaNucleotides = [
  'G',
  'C',
  'T',
  'A',
]

const RnaNucleotides = [
  'C',
  'G',
  'A',
  'U',
]

export function toRna(dnaNucleotides: string): string {
  let result = ""
  for (const nuc of dnaNucleotides) {
    const index = DnaNucleotides.indexOf(nuc)
    if (index < 0) throw new Error("Invalid input DNA.")
    result += RnaNucleotides[DnaNucleotides.indexOf(nuc)]
  }
  return result
}
