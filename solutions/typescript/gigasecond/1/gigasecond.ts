export class Gigasecond {
  constructor (private readonly initialDate: Date) {}
  public date(): Date {
    return new Date(this.initialDate.getTime() + 1000 ** 4)
  }
}
