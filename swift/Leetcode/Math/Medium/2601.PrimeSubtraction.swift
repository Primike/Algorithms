// Pick an index i that you haven’t picked before, 
// and pick a prime p strictly less than nums[i], then subtract p from nums[i].
// Return true if you can make nums a strictly increasing 
// array using the above operation and false otherwise.
// A strictly increasing array is an array whose 
// each element is strictly greater than its preceding element.

func primeSubOperation(_ nums: [Int]) -> Bool {
    let maxElement = nums.max() ?? 0
    let sieveSize = max(2, maxElement + 1)
    let limit = Int(sqrt(Double(sieveSize))) + 1
    var sieve = Array(repeating: 1, count: sieveSize)
    sieve[0] = 0
    sieve[1] = 0

    for i in 2..<limit {
        if sieve[i] == 1 {
            for j in stride(from: i * i, to: sieveSize, by: i) {
                sieve[j] = 0
            }
        }
    }
    var current = 1
    var i = 0

    while i < nums.count {
        let difference = nums[i] - current
        if difference < 0 { return false }

        if sieve[difference] == 1 || difference == 0 {
            i += 1
            current += 1
        } else {
            current += 1
        }
    }
    
    return true
}

print(primeSubOperation([4,9,6,10]))
print(primeSubOperation([6,8,11,12]))
print(primeSubOperation([5,8,3]))