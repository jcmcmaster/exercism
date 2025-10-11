const MINUTES_PER_DAY = 24 * 60

export class Clock {
  public readonly totalMinutes: number = 0

  constructor(hour: number, minute?: number) {
    let minutes = hour * 60 + (minute ?? 0)
    minutes %= MINUTES_PER_DAY
    if (minutes < 0) minutes += MINUTES_PER_DAY
    this.totalMinutes = minutes
  }

  public toString(): string {
    let hours = (Math.floor(this.totalMinutes / 60)).toString().padStart(2, "0")
    let minutes = (this.totalMinutes % 60).toString().padStart(2, "0")
    return `${hours}:${minutes}`
  }

  public plus(minutes: number): Clock {
    return new Clock(0, this.totalMinutes + minutes)
  }

  public minus(minutes: number): Clock {
    return new Clock(0, this.totalMinutes - minutes)
  }

  public equals(other: Clock): boolean {
    return this.totalMinutes === other.totalMinutes
  }
}
