// Define two integers as follows:
// num1: The sum of all integers in the range [1, n] 
// (both inclusive) that are not divisible by m.
// num2: The sum of all integers in the range [1, n] 
// (both inclusive) that are divisible by m.
// Return the integer num1 - num2.

// Time: O(n), Space: O(1)
func differenceOfSums(_ n: Int, _ m: Int) -> Int {
    var nonDivisible = 0
    var divisible = 0

    for i in 1...n {
        if i % m == 0 {
            divisible += i
        } else {
            nonDivisible += i
        }
    }

    return nonDivisible - divisible
}

print(differenceOfSums(10, 3))
print(differenceOfSums(5, 6))
print(differenceOfSums(5, 1))