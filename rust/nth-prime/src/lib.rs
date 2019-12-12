pub fn nth(n: u32) -> u32 {
    let is_prime = |n| !(2..(n as f32).sqrt() as u32 + 1).any(|i| n % i == 0);

    (2..).filter(|x| is_prime(*x)).nth(n as usize).unwrap_or(0)
}
