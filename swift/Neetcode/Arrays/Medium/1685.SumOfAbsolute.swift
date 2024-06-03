// Build and return an integer array result with the same length 
// as nums such that result[i] is equal to the summation of 
// absolute differences between nums[i] and all the other elements in the array.

// Time: O(n), Space: O(n)
func getSumAbsoluteDifferences(_ nums: [Int]) -> [Int] {
    var prefix1 = Array(repeating: 0, count: nums.count)
    var prefix2 = Array(repeating: 0, count: nums.count)
    let n = nums.count

    for i in 1..<n {
        prefix1[i] = (i * (nums[i] - nums[i - 1])) + prefix1[i - 1]
    }
    
    for i in stride(from: n - 2, to: -1, by: -1) {
        prefix2[i] = ((n - i - 1) * (nums[i + 1] - nums[i])) + prefix2[i + 1]
    }

    return zip(prefix1, prefix2).map { $0 + $1 }
}

print(getSumAbsoluteDifferences([2,3,5]))
print(getSumAbsoluteDifferences([1,4,6,8,10]))