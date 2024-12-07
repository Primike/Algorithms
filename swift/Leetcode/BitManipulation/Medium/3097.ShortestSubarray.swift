// You are given an array nums of non-negative integers and an integer k.
// An array is called special if the bitwise OR of all of its elements is at least k.
// Return the length of the shortest special non-empty 
// subarray of nums, or return -1 if no special subarray exists.

func minimumSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
    var left = 1
    var right = nums.count
    var minLength = -1

    while left <= right {
        let mid = left + (right - left) / 2

        if hasValidSubarray(nums, k, mid) {
            minLength = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return minLength
}

private func hasValidSubarray(_ nums: [Int], _ targetSum: Int, _ windowSize: Int) -> Bool {
    var bitCounts = [Int](repeating: 0, count: 32)

    for right in 0..<nums.count {
        updateBitCounts(&bitCounts, nums[right], 1)

        if right >= windowSize {
            updateBitCounts(&bitCounts, nums[right - windowSize], -1)
        }

        if right >= windowSize - 1 && convertBitsToNum(bitCounts) >= targetSum {
            return true
        }
    }

    return false
}

private func updateBitCounts(_ bitCounts: inout [Int], _ number: Int, _ delta: Int) {
    for pos in 0..<32 {
        if (number & (1 << pos)) != 0 {
            bitCounts[pos] += delta
        }
    }
}

private func convertBitsToNum(_ bitCounts: [Int]) -> Int {
    return bitCounts.enumerated().reduce(0) { $0 + (($1.element > 0) ? (1 << $1.offset) : 0) }
}

print(minimumSubarrayLength([1,2,3], 2))
print(minimumSubarrayLength([2,1,8], 10))
print(minimumSubarrayLength([1,2], 0))