export function hey(message: string): string {
  message = message.trim()

  if (isLoud(message) && isInquisitive(message))
    return "Calm down, I know what I'm doing!"
  if (isInquisitive(message))
    return "Sure."
  if (isLoud(message))
    return "Whoa, chill out!"
  if (isNothing(message))
    return "Fine. Be that way!"
  return "Whatever."
}

const isInquisitive = (message: string): boolean => message.endsWith('?')
const isLoud = (message: string): boolean =>
  /^.*[A-Z].*$/.test(message) && !/^.*[a-z].*$/.test(message)
const isNothing = (message: string): boolean => message.length === 0
