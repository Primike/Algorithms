// Given an integer n, return true if it is a power of four. Otherwise, return false.
// An integer n is a power of four, if there exists an integer x such that n == 4x.

// Time: O(1), Space: O(1)
func isPowerOfFour(_ n: Int) -> Bool {
    guard n > 0 else { return false }
            
    let result = log(Double(n)) / log(4.0)
    
    return result == floor(result)
}

print(isPowerOfFour(16))
print(isPowerOfFour(5))
print(isPowerOfFour(1))