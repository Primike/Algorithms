// In one operation, if num1 >= num2, 
// you must subtract num2 from num1, 
// otherwise subtract num1 from num2.
// For example, if num1 = 5 and num2 = 4, subtract num2 from num1, 
// thus obtaining num1 = 1 and num2 = 4. However, 
// if num1 = 4 and num2 = 5, after one operation, num1 = 4 and num2 = 1.
// Return the number of operations required 
// to make either num1 = 0 or num2 = 0.

// Time: O(n), Space: O(1)
func countOperations(_ num1: Int, _ num2: Int) -> Int {
    var num1 = num1, num2 = num2
    var result = 0

    while num1 > 0, num2 > 0 {
        if num1 > num2 {
            num1 -= num2
        } else {
            num2 -= num1
        }

        result += 1
    }

    return result
}

print(countOperations())
print(countOperations())