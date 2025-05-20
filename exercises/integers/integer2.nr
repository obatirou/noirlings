// integers2.nr
// Learn about signed and unsigned integers with temperature conversion

fn celsius_to_fahrenheit(celsius: i8) -> i16 {
    // TODO: Convert Celsius to Fahrenheit
    // Formula: (celsius * 9/5) + 32
    // Handle both positive and negative temperatures
    // Return i16 as fahrenheit can exceed i8 range
    let celsius_u8 = celsius as u8;

    // If the sign bit is set, manually extend with 1s in the upper byte
    // https://github.com/noir-lang/noir/blob/0112e2197c2a2067d950bf45740d0946bbf75e9c/compiler/noirc_evaluator/src/ssa/ir/instruction.rs#L230
    let mut celsius_i16 = 0;
    if celsius_u8 & 0x80 != 0 {
        // Negative number: sign extend manually
        celsius_i16 = (celsius_u8 as i16) | 0xFF00 as i16;
    } else {
        celsius_i16 = celsius_u8 as i16;
    }
    (celsius_i16 * 9 / 5) + 32
}

fn is_freezing(temps: [i8; 3]) -> [bool; 3] {
    temps.map(|t| t < 0)
}

fn main() {
    // Test temperature conversion
    assert(celsius_to_fahrenheit(0) == 32);
    assert(celsius_to_fahrenheit(-40) == -40);
    assert(celsius_to_fahrenheit(100) == 212);

    // Test freezing temperatures
    let temps = [-5, 0, 20];
    let freezing = is_freezing(temps);
    assert(freezing == [true, false, false]);
}

#[test]
fn test_temperature() {
    main();
}
