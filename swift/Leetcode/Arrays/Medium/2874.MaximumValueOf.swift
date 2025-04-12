// Return the maximum value over all triplets of indices (i, j, k) 
// such that i < j < k. If all such triplets have a negative value, return 0.
// The value of a triplet of indices (i, j, k) is equal to 
// (nums[i] - nums[j]) * nums[k].

// Time: O(n), Space: O(1)
func maximumTripletValue(_ nums: [Int]) -> Int {
    var result = 0
    var subtraction = 0
    var iMax = 0

    for i in 0..<nums.count {
        result = max(result, subtraction * nums[i])
        subtraction = max(subtraction, iMax - nums[i])
        iMax = max(iMax, nums[i])
    }

    return result
}

print(maximumTripletValue([12,6,1,2,7]))
print(maximumTripletValue([1,10,3,4,19]))
print(maximumTripletValue([1,2,3]))