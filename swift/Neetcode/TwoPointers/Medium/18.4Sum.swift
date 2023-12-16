// Given an array nums of n integers, return an array of 
// all the unique quadruplets [nums[a], nums[b], nums[c], nums[d]] such that:
// 0 <= a, b, c, d < n
// a, b, c, and d are distinct.
// nums[a] + nums[b] + nums[c] + nums[d] == target
// You may return the answer in any order.

func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    if nums.count < 4 { return [] }

    let nums = nums.sorted()
    var result = [[Int]]()
    var array = [Int]()

    func nSum(_ n: Int, _ index: Int, _ target: Int) {
        if n != 2 {
            for i in index..<(nums.count - n + 1) {
                if i > index, nums[i] == nums[i - 1] { continue }

                array.append(nums[i])
                nSum(n - 1, i + 1, target - nums[i])
                array.removeLast()
            }

            return
        }

        var left = index, right = nums.count - 1

        while left < right {
            if nums[left] + nums[right] < target {
                left += 1
            } else if nums[left] + nums[right] > target {
                right -= 1
            } else {
                result.append(array + [nums[left], nums[right]])
                left += 1

                while left < right, nums[left] == nums[left - 1] {
                    left += 1
                }
            }
        }
    }

    nSum(4, 0, target)
    return result
}

print(fourSum([1,0,-1,0,-2,2], 0))
print(fourSum([2,2,2,2,2], 8))