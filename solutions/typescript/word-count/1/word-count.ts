export function count(input: string): Map<string, number> {
  const result = new Map<string, number>()

  const words = input
    .match(/\w+('\w+)?[\?]?/g)
    ?.map(x => x.toLowerCase()) ?? []

  for (let word of words) {
    if (result.has(word))
      result.set(word, result.get(word)! + 1)
    else
      result.set(word, 1)
  }

  return result
}
