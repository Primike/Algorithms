// You are given an integer n.
// Define its mirror distance as: abs(n - reverse(n))​​​​​​​ 
// where reverse(n) is the integer formed by reversing the digits of n.
// Return an integer denoting the mirror distance of n​​​​​​​.

// Time: O(log(n)), Space: O(1)
func mirrorDistance(_ n: Int) -> Int {
    var current = n
    var reverse = 0

    while current > 0 {
        let digit = current % 10
        reverse = (reverse * 10) + digit
        current /= 10
    }

    return abs(n - reverse)
}

print(mirrorDistance(25))
print(mirrorDistance(10))
print(mirrorDistance(7))