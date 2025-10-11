export function hey(message: string): string {
  if (message.match(/^.*[A-Z].*$/)&& !message.match(/^.*[a-z].*$/) && message.match(/^.*\?\s*$/))
    return "Calm down, I know what I'm doing!"
  if (message.match(/^.*\?\s*$/))
    return "Sure."
  if (message.match(/^.*[A-Z].*$/)&& !message.match(/^.*[a-z].*$/))
    return "Whoa, chill out!"
  if (message.match(/^\s*$/))
    return "Fine. Be that way!"
  return "Whatever."
}
