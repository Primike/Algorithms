// An ugly number is a positive integer whose prime factors 
// are limited to 2, 3, and 5.
// Given an integer n, return true if n is an ugly number.

func isUgly(_ n: Int) -> Bool {
    if n <= 0 { return false }
    var n = n
    while n % 2 == 0 { n /= 2 }
    while n % 3 == 0 { n /= 3 }
    while n % 5 == 0 { n /= 5 }
    return n == 1
}

print(isUgly(6))
print(isUgly(1))
print(isUgly(14))