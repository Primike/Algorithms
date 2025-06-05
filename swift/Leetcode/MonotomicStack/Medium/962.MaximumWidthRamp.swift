// A ramp in an integer array nums is a pair (i, j) for which 
// i < j and nums[i] <= nums[j]. The width of such a ramp is j - i.
// Given an integer array nums, return the maximum width of a ramp in nums. 
// If there is no ramp in nums, return 0.

// Time: O(n), Space: O(n)
func maxWidthRamp(_ nums: [Int]) -> Int {
    var stack = [Int]()
    var result = 0

    for i in 0..<nums.count {
        if stack.isEmpty || nums[i] <= nums[stack.last!] { stack.append(i) }
    }

    for j in stride(from: nums.count - 1, to: -1, by: -1) {
        while let i = stack.last, nums[j] >= nums[i] {
            stack.removeLast()
            result = max(result, j - i)
        }
    }

    return result
}

print(maxWidthRamp([6,0,8,2,1,5]))
print(maxWidthRamp([9,8,1,0,1,9,4,0,4,1]))


func maxWidthRamp2(_ nums: [Int]) -> Int {
    var postfixArray = Array(repeating: nums[nums.count - 1], count: nums.count)

    for i in (0..<(nums.count - 1)).reversed() {
        postfixArray[i] = max(nums[i], postfixArray[i + 1])
    }

    var result = 0
    var left = 0
    var right = 0

    while right < nums.count {
        while left < right, nums[left] > postfixArray[right] {
            left += 1
        }

        result = max(result, right - left)
        right += 1
    }

    return result
}