// Given an array of integers nums, return the number of good pairs.
// A pair (i, j) is called good if nums[i] == nums[j] and i < j.

// Time: O(n), Space: O(1)
func numIdenticalPairs(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for (_, n) in dict {
        result += (n * (n - 1) / 2)
    }

    return result
}

print(numIdenticalPairs([1,2,3,1,1,3]))
print(numIdenticalPairs([1,1,1,1]))
print(numIdenticalPairs([1,2,3]))