export class LinkedList<TElement> {
  private first?: LinkedListNode<TElement> = undefined
  private last?: LinkedListNode<TElement> = undefined

  public push(element: TElement) {
    if (this.last) {
      this.last.next = new LinkedListNode<TElement>(element, this.last)
      this.last = this.last.next
    }
    else
      this.first = this.last = new LinkedListNode<TElement>(element)
  }

  public pop(): TElement | never {
    let result: TElement
    if (!this.last)
      throw new Error("Can't pop, no values")
    else {
      result = this.last.value
      if (this.last === this.first)
        this.last = this.first = undefined
      else
        this.last = this.last.previous
    }

    return result
  }

  public shift(): TElement | never {
    if (!this.first) throw new Error("Can't shift, no values")
    const result = this.first.value
    this.first = this.first.next
    if (!this.first)
      this.last = undefined
    return result
  }

  public unshift(element: TElement): void {
    if (this.first) {
      const newFirst = new LinkedListNode<TElement>(element, undefined, this.first)
      this.first.previous = newFirst
      this.first = newFirst
    } else {
      this.first = this.last = new LinkedListNode<TElement>(element)
    }
  }

  public delete(element: TElement): void {
    if (!this.first)
      return

    let cur: LinkedListNode<TElement> | undefined = this.first

    while (cur) {
      if (cur.value === element) {
        if (cur.next)
          cur.next.previous = cur.previous
        if (cur === this.first)
          this.first = cur.next
        if (cur.previous)
          cur.previous.next = cur.next
        if (cur === this.last)
          this.last = cur.previous
      }

      cur = cur.next
    }
  }

  public count(): number {
    if (!this.first)
      return 0

    let count: number = 1
    let cur: LinkedListNode<TElement> = this.first

    while (cur.next) {
      cur = cur.next
      count++
    }

    return count
  }
}

export class LinkedListNode<TElement> {
  constructor(
    value: TElement,
    previous?: LinkedListNode<TElement>,
    next?: LinkedListNode<TElement>) {
    this.value = value
    if (next)
      this.next = next
    if (previous)
      this.previous = previous
  }

  value: TElement
  next?: LinkedListNode<TElement>
  previous?: LinkedListNode<TElement>
}
