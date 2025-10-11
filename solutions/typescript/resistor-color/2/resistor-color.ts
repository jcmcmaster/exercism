export const COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
] as const

type Color = typeof COLORS[number]

export const colorCode = (color: Color): number => {
  return COLORS.indexOf(color)
}
