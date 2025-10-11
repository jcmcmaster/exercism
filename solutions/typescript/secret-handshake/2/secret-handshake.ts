
export function commands(encodedCommands: number): string[] {
  const commandValues: Map<number, string> = new Map([
    [0b0001, "wink"],
    [0b0010, "double blink"],
    [0b0100, "close your eyes"],
    [0b1000, "jump"],
  ])

  const reverseValue: number = 0b10000

  const commands: string[] = []

  for (const [val, action] of commandValues) {
    if (encodedCommands & val)
      commands.push(action)
  }

  if (encodedCommands & reverseValue) {
    commands.reverse()
  }

  return commands
}
