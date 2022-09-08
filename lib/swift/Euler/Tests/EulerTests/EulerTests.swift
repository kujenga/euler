import XCTest
@testable import Euler

final class PrimalityTests: XCTestCase {
    // List of primes under 100
    // From https://en.wikipedia.org/wiki/List_of_prime_numbers#The_first_1000_prime_numbers
    let primes100 = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97]

    func testPrimes() throws {
        for n in primes100 {
            XCTAssertTrue(n.isPrime(), "prime: \(n)")
        }
    }

    func testNonPrimes() throws {
        let prime100Set = Set(primes100)
        for n in 0...100 {
            if prime100Set.contains(n) {
                continue;
            }
            XCTAssertFalse(n.isPrime(), "not prime: \(n)")
        }
    }
}
