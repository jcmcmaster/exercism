export function find(haystack: number[], needle: number): number | never {
  return SearchImpl(haystack, needle, 0, haystack.length - 1)
}

function SearchImpl(haystack: number[], needle: number, lo: number, hi: number): number | never {
  if (lo > hi || lo < 0)
    throw new Error('Value not in array')

  const mid = Math.floor((hi - lo) / 2 + lo)

  if (haystack[mid] === needle)
    return mid
  else if (haystack[mid] < needle)
    return SearchImpl(haystack, needle, mid + 1, hi)
  else
    return SearchImpl(haystack, needle, lo, mid - 1)
}
