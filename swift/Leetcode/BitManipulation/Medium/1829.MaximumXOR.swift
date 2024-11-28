// Find a non-negative integer k < 2maximumBit such that nums[0] XOR nums[1]
// XOR ... XOR nums[nums.length-1] XOR k is maximized. k is the answer to the ith query.
// Remove the last element from the current array nums.
// Return an array answer, where answer[i] is the answer to the ith query.

func getMaximumXor(_ nums: [Int], _ maximumBit: Int) -> [Int] {
    var prefix_xor = [Int](repeating: 0, count: nums.count)
    prefix_xor[0] = nums[0]
    for i in 1..<nums.count {
        prefix_xor[i] = prefix_xor[i - 1] ^ nums[i]
    }
    var ans = [Int](repeating: 0, count: nums.count)
    let mask = (1 << maximumBit) - 1
    for i in 0..<nums.count {
        let current_xor = prefix_xor[prefix_xor.count - 1 - i]
        ans[i] = current_xor ^ mask
    }
    return ans
}

print(getMaximumXor([0,1,1,3], 2))
print(getMaximumXor([2,3,4,7], 3))
print(getMaximumXor([0,1,2,2,5,7], 3))