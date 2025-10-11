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
    // return (this.numerator ** exp) /
    //   (this.denominator ** exp)

    return Math.pow(exp ** this.numerator, 1 / this.denominator)
  }

  reduce(): Rational {
    function findGcd(a: number, b: number): number {
      return b === 0 ? a : findGcd(b, a % b)
    }

    const large: number = Math.max(this.numerator, this.denominator)
    const small: number = Math.min(this.numerator, this.denominator)

    const gcd = Math.abs(findGcd(large, small))

    // don't return negative zeroes
    let newNumerator: number = Math.abs(this.numerator) / gcd
    let newDenominator: number = Math.abs(this.denominator) / gcd

    const isNegative = (this.numerator < 0) !== (this.denominator < 0)

    if (newNumerator === 0)
      newNumerator = 0
    if (newDenominator === 0)
      newDenominator = 0

    if (isNegative)
      newNumerator *= -1

    return new Rational(newNumerator, newDenominator)
  }
}
