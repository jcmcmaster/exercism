const getColorCode = (color: string): string => {
  switch (color) {
    case "black": return "0"
    case "brown": return "1"
    case "red": return "2"
    case "orange": return "3"
    case "yellow": return "4"
    case "green": return "5"
    case "blue": return "6"
    case "violet": return "7"
    case "grey": return "8"
    case "white": return "9"
    default: return ""
  }
}

export function decodedValue(colors: string[]): number {
  const [color1, color2] = colors
  return parseInt(getColorCode(color1) + getColorCode(color2))
}
