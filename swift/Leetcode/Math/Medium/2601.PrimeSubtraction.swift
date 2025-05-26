// Pick an index i that you haven’t picked before, 
// and pick a prime p strictly less than nums[i], then subtract p from nums[i].
// Return true if you can make nums a strictly increasing 
// array using the above operation and false otherwise.
// A strictly increasing array is an array whose 
// each element is strictly greater than its preceding element.

func primeSubOperation(_ nums: [Int]) -> Bool {
    let sieveSize = max(2, (nums.max() ?? 0) + 1)
    let limit = Int(sqrt(Double(sieveSize))) + 1
    var sieve = Array(repeating: true, count: sieveSize)
    sieve[0] = false
    sieve[1] = false

    for i in 2..<limit {
        if !sieve[i] { continue }
        
        var current = i * i

        while current < sieveSize {
            sieve[current] = false
            current += i
        }
    }

    var current = 1
    var i = 0

    while i < nums.count {
        let difference = nums[i] - current
        if difference < 0 { return false }

        if sieve[difference] || difference == 0 {
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