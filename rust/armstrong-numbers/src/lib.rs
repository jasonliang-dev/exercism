pub fn is_armstrong_number(num: u32) -> bool {
    let digits: Vec<u32> = num
        .to_string()
        .chars()
        .map(|x| x.to_digit(10).unwrap())
        .collect();

    digits
        .iter()
        .map(|digit| digit.pow(digits.len() as u32))
        .sum::<u32>()
        == num
}
