import Foundation

// Helper functions on the Int type.
extension Int {
    // Check if a number is prime, efficiently.
    public func isPrime() -> Bool {
        if self == 2 || self == 3 {
            return true;
        }
        if self <= 1 || self % 2 == 0 || self % 3 == 0 {
            return false;
        }
        var i = 5;
        while i * i <= self {
            if self % i == 0 || self % (i + 2) == 0 {
                return false;
            }
            i += 6;
        }
        return true;
    }
}

// Helper to allow for exponentiation on integers directly. Required because
// Decimal cannot cast directly to Int.
public func pow(_ base: Int, _ power: Int) -> Int {
    // Call into Foundation function.
    let r = pow(Decimal(base), power)
    return NSDecimalNumber(decimal: r).intValue;
}

