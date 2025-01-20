// Given an integer array nums and an integer k, find three non-overlapping 
// subarrays of length k with maximum sum and return them.
// Return the result as a list of indices representing the starting position 
// of each interval (0-indexed). If there are multiple answers, 
// return the lexicographically smallest one.

func maxSumOfThreeSubarrays(_ nums: [Int], _ k: Int) -> [Int] {
    let n = nums.count
    var prefixSum = Array(repeating: 0, count: n + 1)
    
    for i in 0..<n {
        prefixSum[i + 1] = prefixSum[i] + nums[i]
    }
    
    func subarraySum(start: Int) -> Int {
        return prefixSum[start + k] - prefixSum[start]
    }
    
    var left = Array(repeating: 0, count: n)
    var bestLeftSum = subarraySum(start: 0)
    left[k - 1] = 0 
    
    for i in k..<n {
        let currSum = subarraySum(start: i - k + 1)
        if currSum > bestLeftSum {
            bestLeftSum = currSum
            left[i] = i - k + 1
        } else {
            left[i] = left[i - 1]
        }
    }
    
    var right = Array(repeating: 0, count: n)
    var bestRightSum = subarraySum(start: n - k)
    right[n - k] = n - k
    
    for i in stride(from: n - k - 1, through: 0, by: -1) {
        let currSum = subarraySum(start: i)
        if currSum >= bestRightSum {
            bestRightSum = currSum
            right[i] = i
        } else {
            right[i] = right[i + 1]
        }
    }
    
    var maxTotal = 0
    var ans = [0, 0, 0]
    
    for mid in k...(n - 2*k) {
        let leftIndex = left[mid - 1]     
        let rightIndex = right[mid + k]  
        let total = subarraySum(start: leftIndex)
                    + subarraySum(start: mid)
                    + subarraySum(start: rightIndex)
        
        if total > maxTotal {
            maxTotal = total
            ans = [leftIndex, mid, rightIndex]
        }
    }
    
    return ans
}

print(maxSumOfThreeSubarrays([1,2,1,2,6,7,5,1], 2))
print(maxSumOfThreeSubarrays([1,2,1,2,1,2,1,2,1], 2))