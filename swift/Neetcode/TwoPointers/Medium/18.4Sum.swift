// Given an array nums of n integers, return an array of 
// all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
// 0 <= a, b, c, d < n
// a, b, c, and d are distinct.
// nums[a] + nums[b] + nums[c] + nums[d] == target
// You may return the answer in any order.


func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 {
        return []
    }

    var nums = nums
    nums.sort()

    var result = [[Int]](), kArray = [Int]()

    func kSum(_ k: Int, _ start: Int, _ target: Int) {
        if k != 2 {
            for i in start..<(nums.count - k + 1) {
                if i > start && nums[i] == nums[i - 1] {
                    continue
                }

                kArray.append(nums[i])
                kSum(k - 1, i + 1, target - nums[i])
                kArray.removeLast()
            }

            return
        }

        var left = start, right = nums.count - 1

        while left < right {
            if nums[left] + nums[right] < target {
                left += 1
            } else if nums[left] + nums[right] > target {
                right -= 1
            } else {
                result.append(kArray + [nums[left], nums[right]])
                left += 1

                while left < right && nums[left] == nums[left - 1] {
                    left += 1
                }
            }
        }
    }

    kSum(4, 0, target)
    return result
}

print(fourSum([1,0,-1,0,-2,2], 0))
print(fourSum([2,2,2,2,2], 8))