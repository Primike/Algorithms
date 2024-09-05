// The distance of a pair of integers a and b is defined 
// as the absolute difference between a and b.
// Given an integer array nums and an integer k, 
// return the kth smallest distance among all the pairs 
// nums[i] and nums[j] where 0 <= i < j < nums.length.

// Time: O(n * log(n) + n * log(d)), Space: O(1)
func smallestDistancePair(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    var left = 0, right = nums[nums.count - 1] - nums[0]

    while left < right {
        let mid = (right + left) / 2
        var count = 0
        var i = 0

        for j in 1..<nums.count {
            while nums[j] - nums[i] > mid {
                i += 1
            }
            
            count += j - i
        }

        if count >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(smallestDistancePair([1,3,1], 1))
print(smallestDistancePair([1,1,1], 2))
print(smallestDistancePair([1,6,1], 3))