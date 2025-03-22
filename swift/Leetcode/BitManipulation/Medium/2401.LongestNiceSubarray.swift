func longestNiceSubarray(_ nums: [Int]) -> Int {
    var usedBits = 0
    var windowStart = 0
    var maxLength = 0
    for windowEnd in 0..<nums.count {
        while (usedBits & nums[windowEnd]) != 0 {
            usedBits ^= nums[windowStart]
            windowStart += 1
        }
        usedBits |= nums[windowEnd]
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    return maxLength
}