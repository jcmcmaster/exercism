export function hey(message: string): string {
  message = message.trim()

  if (isLoud(message) && isInquisitive(message))
    return "Calm down, I know what I'm doing!"
  if (isLoud(message))
    return "Whoa, chill out!"
  if (isInquisitive(message))
    return "Sure."
  if (isNothing(message))
    return "Fine. Be that way!"
  return "Whatever."
}

const isLoud = (message: string): boolean =>
  /^.*[A-Z].*$/.test(message) && !/^.*[a-z].*$/.test(message)

const isInquisitive = (message: string): boolean =>
  message.endsWith('?')

const isNothing = (message: string): boolean =>
  message.length === 0
