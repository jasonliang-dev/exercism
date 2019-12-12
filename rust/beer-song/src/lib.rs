use itertools::Itertools;

pub fn verse(n: u32) -> String {
    let count_bottles = |n: u32| match n {
        0 => String::from("no more bottles"),
        1 => String::from("1 bottle"),
        _ => format!("{} bottles", n),
    };

    let action = match n {
        0 => "Go to the store and buy some more",
        1 => "Take it down and pass it around",
        _ => "Take one down and pass it around",
    };

    format!(
        "{} of beer on the wall, {} of beer.\n{}, {} of beer on the wall.\n",
        if n == 0 {
            String::from("No more bottles")
        } else {
            count_bottles(n)
        },
        count_bottles(n),
        action,
        count_bottles(if n == 0 { 99 } else { n - 1 })
    )
}

pub fn sing(start: u32, end: u32) -> String {
    (end..start + 1)
        .rev()
        .map(verse)
        .intersperse(String::from("\n"))
        .collect()
}
