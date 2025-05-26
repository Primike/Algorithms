// Given two positive integers left and right, 
// find the two integers num1 and num2 such that:
// left <= num1 < num2 <= right .
// Both num1 and num2 are prime numbers.
// num2 - num1 is the minimum amongst 
// all other pairs satisfying the above conditions.
// Return the positive integer array ans = [num1, num2]. 
// If there are multiple pairs satisfying these conditions, 
// return the one with the smallest num1 value. 
// If no such numbers exist, return [-1, -1].

// Time: O(n * log(log(n))), Space: O(n)
func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
    if right == left { return [-1, -1] }
    
    var isPrime = Array(repeating: true, count: right + 1)
    var sieve = [Int]()

    for i in 2...right {
        if !isPrime[i] { continue }
        if i >= left { sieve.append(i) }
        
        var number = i + i

        while number <= right {
            isPrime[number] = false
            number += i
        }
    }

    if sieve.count <= 1 { return [-1, -1] }

    var result = [-1, -1]
    var closest = Int.max

    for i in 1..<sieve.count {
        let difference = sieve[i] - sieve[i - 1]

        if closest > difference {
            result = [sieve[i - 1], sieve[i]]
            closest = difference
        }
    }

    return result
}

print(closestPrimes(10, 19))
print(closestPrimes(4, 6))