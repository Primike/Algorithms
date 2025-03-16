// Given a binary array nums, return the maximum number of consecutive 1's 
// in the array if you can flip at most one 0.

// Time: O(n), Space: O(n)
func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var onesFromLeft = Array(repeating: 0, count: nums.count)
    var onesFromRight = Array(repeating: 0, count: nums.count)
    onesFromLeft[0] = nums[0] == 1 ? 1 : 0
    onesFromRight[nums.count - 1] = nums[nums.count - 1] == 1 ? 1 : 0
    var i = 1, j = nums.count - 2

    while i < nums.count {
        if nums[i] == 1 { onesFromLeft[i] += onesFromLeft[i - 1] + 1 }
        if nums[j] == 1 { onesFromRight[j] += onesFromRight[j + 1] + 1 }

        i += 1
        j -= 1
    }

    var result = 0

    for i in 0..<nums.count {
        if nums[i] == 1 {
            result = max(result, onesFromLeft[i], onesFromRight[i])
        } else {
            var total = 1

            if i > 0 { total += onesFromLeft[i - 1] }
            if i < nums.count - 1 { total += onesFromRight[i + 1] }

            result = max(result, total)
        }
    }

    return result
}

print(findMaxConsecutiveOnes([1,0,1,1,0]))
print(findMaxConsecutiveOnes([1,0,1,1,0,1]))