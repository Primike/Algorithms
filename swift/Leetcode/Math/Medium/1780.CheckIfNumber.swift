// Given an integer n, return true if it is possible to represent 
// n as the sum of distinct powers of three. Otherwise, return false.
// An integer y is a power of three if there exists an integer x such that y == 3x.

// Time: O(log3(n)), Space: O(1)
func checkPowersOfThree(_ n: Int) -> Bool {
    var current = n

    while current > 0 {
        if current % 3 == 2 { return false }

        current /= 3
    }

    return true
}

print(checkPowersOfThree(12))
print(checkPowersOfThree(91))
print(checkPowersOfThree(21))