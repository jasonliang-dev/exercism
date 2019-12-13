pub fn brackets_are_balanced(string: &str) -> bool {
    let pop_and_match = |mut stack: Vec<_>, other_bracket| {
        stack.pop().and_then(|top| {
            if top == other_bracket {
                Some(stack)
            } else {
                None
            }
        })
    };

    string
        .chars()
        .fold(Some(Vec::new()), |option, ch| {
            option.and_then(|mut stack| match ch {
                '[' | '{' | '(' => {
                    stack.push(ch);
                    Some(stack)
                }
                ']' => pop_and_match(stack, '['),
                '}' => pop_and_match(stack, '{'),
                ')' => pop_and_match(stack, '('),
                _ => Some(stack),
            })
        })
        .and_then(|stack| if stack.is_empty() { Some(stack) } else { None })
        .is_some()
}
