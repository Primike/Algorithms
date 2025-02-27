// You are given an integer array nums. 
// The absolute sum of a subarray [numsl, 
// numsl+1, ..., numsr-1, numsr] is 
// abs(numsl + numsl+1 + ... + numsr-1 + numsr).
// Return the maximum absolute sum of any 
// (possibly empty) subarray of nums.

func maxAbsoluteSum(_ nums: [Int]) -> Int {
    var minPrefixSum = 0
    var maxPrefixSum = 0
    var prefixSum = 0
    for num in nums {
        prefixSum += num
        minPrefixSum = min(minPrefixSum, prefixSum)
        maxPrefixSum = max(maxPrefixSum, prefixSum)
    }
    return maxPrefixSum - minPrefixSum
}

print(maxAbsoluteSum([1,-3,2,3,-4]))
print(maxAbsoluteSum([2,-5,1,-4,3,-2]))