object MatchingBrackets {
  def isPaired(brackets: String): Boolean = isPaired(Nil, brackets.toList)

  def isPaired(stack: List[Char], brackets: List[Char]): Boolean = brackets match {
    case (c :: cs) => (c, stack.headOption) match {
      case (']', Some('[')) | ('}', Some('{')) | (')', Some('(')) => isPaired(stack.tail, cs)
      case ('[' | '{' | '(', _) => isPaired(c :: stack, cs)
      case (']' | '}' | ')', _) => false
      case _ => isPaired(stack, cs)
    }
    case _ => stack.length == 0
  }
}
