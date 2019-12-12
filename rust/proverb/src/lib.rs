pub fn build_proverb(list: &[&str]) -> String {
    match list.first() {
        Some(item) => list
            .iter()
            .zip(&list[1..])
            .map(|(first, second)| format!("For want of a {} the {} was lost.\n", first, second))
            .chain(std::iter::once(format!(
                "And all for the want of a {}.",
                item
            )))
            .collect::<String>(),
        None => String::new(),
    }
}
