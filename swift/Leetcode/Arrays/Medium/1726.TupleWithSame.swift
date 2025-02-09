// Given an array nums of distinct positive integers, 
// return the number of tuples (a, b, c, d) such that a * b = c * d 
// where a, b, c, and d are elements of nums, and a != b != c != d.

func tupleSameProduct(_ nums: [Int]) -> Int {
    let n = nums.count
    var pairProductsFrequency: [Int: Int] = [:]
    var total = 0
    for firstIndex in 0..<n {
        for secondIndex in (firstIndex + 1)..<n {
            let product = nums[firstIndex] * nums[secondIndex]
            pairProductsFrequency[product, default: 0] += 1
        }
    }
    for freq in pairProductsFrequency.values {
        let pairs = (freq - 1) * freq / 2
        total += 8 * pairs
    }
    return total
}

print(tupleSameProduct([2,3,4,6]))
print(tupleSameProduct([1,2,4,5,10]))