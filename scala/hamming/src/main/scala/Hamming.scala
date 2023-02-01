object Hamming {
  def distance(dnaStrandOne: String, dnaStrandTwo: String): Option[Int] = distance(dnaStrandOne.toList, dnaStrandTwo.toList)

  def distance(lhs: List[Char], rhs: List[Char]): Option[Int] = (lhs, rhs) match {
    case (Nil, Nil) => Some(0)
    case (l :: left, r :: right) => distance(left, right).map(n => n + (if (l == r) 0 else 1))
    case _ => None
  }
}
