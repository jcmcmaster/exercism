export function isPangram(candidate: string): boolean {
  return new Set(
    candidate
      .split("")
      .map(x => x.toLowerCase())
      .filter(x => (/[a-z]/).test(x)))
    .size >= 26
}
