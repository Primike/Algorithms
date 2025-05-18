// Given an integer array nums, 
// return all the triplets [nums[i], nums[j], nums[k]] 
// such that i != j, i != k, and j != k, 
// and nums[i] + nums[j] + nums[k] == 0.

// Time: O(n^2), Space: O(1)
func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]]()

    for i in 0..<(nums.count - 2) {
        if i > 0, nums[i - 1] == nums[i] { continue }

        var j = i + 1, k = nums.count - 1 

        while j < k {
            var sum = nums[i] + nums[j] + nums[k]

            if sum > 0 {
                k -= 1
            } else if sum < 0 {
                j += 1
            } else {
                result.append([nums[i], nums[j], nums[k]])
                var last = nums[j]

                while j < k, last == nums[j] {
                    j += 1
                }
            }
        }
    }

    return result
}

print(threeSum([-1,0,1,2,-1,-4]))
print(threeSum([0,1,1]))
print(threeSum([0,0,0]))