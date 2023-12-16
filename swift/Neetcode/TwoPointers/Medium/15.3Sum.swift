// Given an integer array nums, 
// return all the triplets [nums[i], nums[j], nums[k]] 
// such that i != j, i != k, and j != k, 
// and nums[i] + nums[j] + nums[k] == 0.

func threeSum(_ nums: [Int]) -> [[Int]] {
    var nums = nums.sorted()
    var result = [[Int]]()

    for i in 0..<nums.count - 2 {
        if i > 0, nums[i - 1] == nums[i] { continue }

        var left = i + 1, right = nums.count - 1 
        
        while left < right, right < nums.count {
            var sum = nums[i] + nums[left] + nums[right]

            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                left += 1

                while left < right, nums[left] == nums[left - 1] { 
                    left += 1 
                }
            } else if sum > 0 {
                right -= 1
            } else {
                left += 1
            }
        }
    }

    return result
}

print(threeSum([-1,0,1,2,-1,-4]))
print(threeSum([0,1,1]))
print(threeSum([0,0,0]))