// Given an array of integers nums and an integer k. 
// A continuous subarray is called nice if there are k odd numbers on it.
// Return the number of nice sub-arrays.

// Time: O(n), Space: O(1)
func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var odd = 0
    var subarrays = 0
    var left = 0

    for i in 0..<nums.count {
        if nums[i] % 2 != 0 { odd += 1 }
        if odd == k { subarrays = 0 }
        
        while odd == k {
            if nums[left] % 2 != 0 { odd -= 1 }
            subarrays += 1
            left += 1
        }
        
        result += subarrays
    }

    return result
}

print(numberOfSubarrays([1,1,2,1,1], 3))
print(numberOfSubarrays([2,4,6], 1))
print(numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2))