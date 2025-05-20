// slice4.nr
// use the `hint` watch subcommand for a hint.

struct Stats {
    sum: Field,
    count: Field,
}

fn calculate_average(numbers: [Field]) -> Field {
    // TODO:
    // 1. Use fold to accumulate both sum and count of elements
    // 2. Calculate and return the average
    // Hint: Create a Stats struct to hold intermediate values
    // Your code here
    let stats = numbers.fold(Stats { sum: 0, count: 0 }, |acc, x| {
        Stats { sum: acc.sum + x, count: acc.count + 1 }
    });
    stats.sum / stats.count
}

fn main() {
    let numbers = &[2, 4, 6, 8, 10];
    let average = calculate_average(numbers);

    assert(average == 6);
}

#[test]
fn test_reduction() {
    main();
}
