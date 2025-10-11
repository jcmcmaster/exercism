const commandValues: Map<number, string> = new Map([
  [0, "wink"],
  [1, "double blink"],
  [2, "close your eyes"],
  [3, "jump"],
])

export function commands(encodedCommands: number): string[] {
  const binaryString: string = (encodedCommands >>> 0)
    .toString(2)
    .padStart(5, "0")
    .slice(1)

  const result: string[] = []
  for (let i = binaryString.length - 1; i >= 0; i--) {
    if (binaryString[i] === "1")
      result.push(commandValues.get(binaryString.length - (i + 1)) ?? "error")
  }

  if (encodedCommands >= 16) {
    result.reverse()
  }

  return result
}
