export class Clock {
  hour: number
  minute: number

  constructor(hour: number, minute?: number) {
    minute ??= 0
    this.minute = Math.floor(minute % 60)
    this.hour = Math.floor((hour + minute / 60) % 24)

    if (this.hour < 0)
      this.hour += 24
    if (this.minute < 0)
      this.minute += 60
  }

  public toString(): string {
    return this.hour.toString().padStart(2, "0")
      + ":"
      + this.minute.toString().padStart(2, "0")
  }

  public plus(minutes: number): Clock {
    let newClock = new Clock(this.hour, this.minute + minutes)
    this.hour = newClock.hour
    this.minute = newClock.minute
    return this
  }

  public minus(minutes: number): Clock {
    let newClock = new Clock(this.hour, this.minute - minutes)
    this.hour = newClock.hour
    this.minute = newClock.minute
    return this
  }

  public equals(other: Clock): boolean {
    return this.hour === other.hour && this.minute === other.minute
  }
}
