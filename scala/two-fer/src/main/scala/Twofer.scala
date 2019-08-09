object Twofer {
  def twofer(): String =
    twofer("you")

  def twofer(name: String): String =
    s"One for $name, one for me."
}
