// Given an array of integers arr, return the number of 
// subarrays with an odd sum.
// Since the answer can be very large, return it modulo 109 + 7.

func numOfSubarrays(_ arr: [Int]) -> Int {
    let MOD = 1_000_000_007
    var count = 0, prefixSum = 0, oddCount = 0, evenCount = 1
    for num in arr {
        prefixSum += num
        if prefixSum % 2 == 0 {
            count += oddCount
            evenCount += 1
        } else {
            count += evenCount
            oddCount += 1
        }
        count %= MOD
    }
    return count
}

print(numOfSubarrays([1,3,5]))
print(numOfSubarrays([2,4,6]))
print(numOfSubarrays([1,2,3,4,5,6,7]))