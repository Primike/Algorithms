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

func _sieve(_ upperLimit: Int) -> [Bool] {
    var sieve = [Bool](repeating: true, count: upperLimit + 1)
    if upperLimit >= 0 { sieve[0] = false }
    if upperLimit >= 1 { sieve[1] = false }
    if upperLimit < 2 { return sieve }
    let limit = Int(Double(upperLimit).squareRoot())
    for number in 2...limit {
        if sieve[number] {
            for multiple in stride(from: number * number, through: upperLimit, by: number) {
                sieve[multiple] = false
            }
        }
    }
    return sieve
}

func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
    let sieveArray = _sieve(right)
    let primeNumbers = (left...right).filter { sieveArray[$0] }
    if primeNumbers.count < 2 { return [-1, -1] }
    var minDifference = Int.max
    var closestPair = (-1, -1)
    for i in 1..<primeNumbers.count {
        let difference = primeNumbers[i] - primeNumbers[i - 1]
        if difference < minDifference {
            minDifference = difference
            closestPair = (primeNumbers[i - 1], primeNumbers[i])
        }
    }
    return [closestPair.0, closestPair.1]
}

print(closestPrimes(10, 19))
print(closestPrimes(4, 6))