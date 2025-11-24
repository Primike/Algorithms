// Given an binary array nums and an integer k, 
// return true if all 1's are at least k places away from each other, 
// otherwise return false.

// Time: O(n), Space: O(1)
func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
    var lastIndex = -k - 1

    for i in 0..<nums.count {
        if nums[i] != 1 { continue }
        if i - lastIndex <= k { return false }
        lastIndex = i
    }

    return true
}

print(kLengthApart([1,0,0,0,1,0,0,1], 2))
print(kLengthApart([1,0,0,1,0,1], 2))