// You are given an integer array nums of length n and a 2D array queries, 
// where queries[i] = [li, ri].
// For each queries[i]:
// Select a subset of indices within the range [li, ri] in nums.
// Decrement the values at the selected indices by 1.
// A Zero Array is an array where all elements are equal to 0.
// Return true if it is possible to transform nums into a Zero Array 
// after processing all the queries sequentially, otherwise return false.

// Time: O(n), Space: O(n)
func isZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Bool {
    var lineSweep = Array(repeating: 0, count: nums.count + 1)

    for query in queries {
        lineSweep[query[0]] += 1
        lineSweep[query[1] + 1] -= 1
    }

    var current = 0

    for i in 0..<nums.count {
        current += lineSweep[i]
        if nums[i] > current { return false }
    }

    return true
}

print(isZeroArray([1,0,1], [[0,2]]))
print(isZeroArray([4,3,2,1], [[1,3],[0,2]]))