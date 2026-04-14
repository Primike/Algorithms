// Given an integer array nums (0-indexed) and two integers target and start, 
// find an index i such that nums[i] == target and abs(i - start) is minimized. 
// Note that abs(x) is the absolute value of x.
// Return abs(i - start).

// Time: O(n), Space: O(1)
func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
    var result = Int.max

    for (i, number) in nums.enumerated() {
        if number != target { continue }
        result = min(result, abs(i - start))
    }

    return result
}

print(getMinDistance([1,2,3,4,5], 5, 3))
print(getMinDistance([1], 1, 0))
print(getMinDistance([1,1,1,1,1,1,1,1,1,1], 1, 0))