// Given a 0-indexed integer array nums of 
// length n and an integer k, return the number of pairs 
// (i, j) where 0 <= i < j < n, such that 
// nums[i] == nums[j] and (i * j) is divisible by k.

// Time: O(n^2), Space: O(1)
func countPairs(_ nums: [Int], _ k: Int) -> Int {
    var result = 0

    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            if nums[i] != nums[j] { continue }
            if (i * j) % k == 0 { result += 1 }
        }
    }

    return result
}

print(countPairs([3,1,2,2,2,1,3], 2))
print(countPairs([1,2,3,4], 1))