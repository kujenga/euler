extension Int {
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
