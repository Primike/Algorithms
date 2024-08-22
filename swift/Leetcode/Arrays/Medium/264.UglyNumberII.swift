// An ugly number is a positive integer whose 
// prime factors are limited to 2, 3, and 5.
// Given an integer n, return the nth ugly number.

// Time: O(n * log(n)), Space: O(n)
func nthUglyNumber(_ n: Int) -> Int {
    var uglyNumbers = Set([1])        
    var result = 1
    
    for _ in 0..<n {
        result = uglyNumbers.min() ?? 1
        uglyNumbers.remove(result)
        
        uglyNumbers.insert(result * 2)
        uglyNumbers.insert(result * 3)
        uglyNumbers.insert(result * 5)
    }
    
    return result
}

print(nthUglyNumber(10))
print(nthUglyNumber(1))