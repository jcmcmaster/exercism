/*
 * input: string "abc" 
 * output: string "cba"
 */

export function reverse(input: string): string {
  const chars = [...input]
  let swap = ""
  for (let i = 0; i < chars.length / 2; i++) {
    swap = chars[i]
    chars[i] = chars[chars.length - i - 1]
    chars[chars.length - i - 1] = swap
  }
  return chars.join('')
}
