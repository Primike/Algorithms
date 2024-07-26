// Given an array of integers nums, sort the array in 
// increasing order based on the frequency of the values. 
// If multiple values have the same frequency, sort them in decreasing order.
// Return the sorted array.

// Time: O(n * log(n)), Space: O(n)
func frequencySort(_ nums: [Int]) -> [Int] {
    var nums = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }.map { ($0.key, $0.value) }
    nums.sort { ($0.1, -$0.0) < ($1.1, -$1.0) }
    var result = [Int]()

    for (key, value) in nums {
        result += Array(repeating: key, count: value)
    }

    return result
}

print(frequencySort([1,1,2,2,2,3]))
print(frequencySort([2,3,1,3,2]))
print(frequencySort([-1,1,-6,4,5,-6,1,4,1]))