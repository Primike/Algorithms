// You are given a binary array nums and an integer k.
// A k-bit flip is choosing a subarray of length k from nums 
// and simultaneously changing every 0 in the subarray to 1, 
// and every 1 in the subarray to 0.
// Return the minimum number of k-bit flips required so that 
// there is no 0 in the array. If it is not possible, return -1.

func minKBitFlips(_ nums: [Int], _ k: Int) -> Int {
    var flipped = Array(repeating: false, count: nums.count)
    var validFlipsFromPastWindow = 0
    var result = 0

    for i in 0..<nums.count {
        if i >= k, flipped[i - k] { validFlipsFromPastWindow -= 1 }

        if validFlipsFromPastWindow % 2 == nums[i] {
            if i + k > nums.count { return -1 }

            validFlipsFromPastWindow += 1
            flipped[i] = true
            result += 1
        }
    }

    return result
}

print(minKBitFlips([0,1,0], 1))
print(minKBitFlips([1,1,0], 2))
print(minKBitFlips([0,0,0,1,0,1,1,0], 3))