// You are given an integer array nums of length n and a 
// 2D array queries where queries[i] = [li, ri, vali].
// Each queries[i] represents the following action on nums:
// Decrement the value at each index in the range 
// [li, ri] in nums by at most vali.
// The amount by which each value is decremented 
// can be chosen independently for each index.
// A Zero Array is an array with all its elements equal to 0.
// Return the minimum possible non-negative value of k, 
// such that after processing the first k queries in sequence, 
// nums becomes a Zero Array. If no such k exists, return -1.

// Time: O(n * log(q)), Space: O(n)
func minZeroArray(_ nums: [Int], _ queries: [[Int]]) -> Int {
    var left = 0, right = queries.count
    var didTransform = false

    while left <= right {
        let mid = (right + left) / 2
        var currentVal = 0
        var decrements = Array(repeating: 0, count: nums.count + 1)
        var canTransform = true

        for i in 0..<mid {
            decrements[queries[i][0]] += queries[i][2]
            decrements[queries[i][1] + 1] -= queries[i][2]
        }

        for i in 0..<nums.count {
            currentVal += decrements[i]
            if currentVal < nums[i] { canTransform = false }
        }

        if canTransform {
            right = mid - 1
            didTransform = true
        } else {
            left = mid + 1
        }
    }

    return didTransform ? left : -1
}

print(minZeroArray([2,0,2], [[0,2,1],[0,2,1],[1,1,3]]))
print(minZeroArray([4,3,2,1], [[1,3,2],[0,2,1]]))