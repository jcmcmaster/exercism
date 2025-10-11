function findGcd(a: number, b: number): number {
  return b === 0 ? a : findGcd(b, a % b)
}

export class Rational {
  constructor(public readonly numerator: number, public readonly denominator: number) { }

  add(other: Rational): Rational {
    return new Rational(
      this.numerator * other.denominator + this.denominator * other.numerator,
      this.denominator * other.denominator).reduce()
  }

  sub(other: Rational): Rational {
    return new Rational(
      this.numerator * other.denominator - this.denominator * other.numerator,
      this.denominator * other.denominator).reduce()
  }

  mul(other: Rational): Rational {
    return new Rational(
      this.numerator * other.numerator,
      this.denominator * other.denominator).reduce()
  }

  div(other: Rational): Rational {
    return new Rational(
      this.numerator * other.denominator,
      this.denominator * other.numerator).reduce()
  }

  abs(): Rational {
    return new Rational(
      Math.abs(this.numerator),
      Math.abs(this.denominator)).reduce()
  }

  exprational(exp: number): Rational {
    if (exp >= 0)
      return new Rational(
        this.numerator ** exp,
        this.denominator ** exp).reduce()
    else {
      return new Rational(
        this.denominator ** Math.abs(exp),
        this.numerator ** Math.abs(exp)).reduce()
    }
  }

  expreal(exp: number): number {
    return Math.pow(exp ** this.numerator, 1 / this.denominator)
  }

  reduce(): Rational {
    const gcd = findGcd(this.numerator, this.denominator)

    let newNumerator: number = this.numerator / gcd
    let newDenominator: number = this.denominator / gcd

    if (newDenominator < 0) {
      newNumerator *= -1
      newDenominator *= -1
    }

    return new Rational(newNumerator, newDenominator)
  }
}
