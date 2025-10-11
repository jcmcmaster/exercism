export function count(input: string): Map<string, number> {
  const result = new Map<string, number>()

  input
    .match(/\w+('\w+)?[\?]?/g)
    ?.map(word => word.toLowerCase())
    ?.forEach(word => {
      result.set(word, (result.get(word) ?? 0) + 1)
    })

  return result
}
