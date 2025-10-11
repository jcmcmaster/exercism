export function score(x: number, y: number): number {
  const dist = Math.sqrt(x**2 + y**2);
  if (dist <= 1)
    return 10;
  else if (dist <= 5)
    return 5;
  else if (dist <= 10)
    return 1;
  else
    return 0;
}
