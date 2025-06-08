// Given an array of integers nums and an integer k. 
// A continuous subarray is called nice if there are k odd numbers on it.
// Return the number of nice sub-arrays.

// Time: O(n), Space: O(1)
func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var left = 0
    var odd = 0

    for (i, number) in nums.enumerated() {
        if number % 2 != 0 { odd += 1 }
        if odd == k { result += 1 }
        
        while odd > k {
            odd -= nums[left] % 2 != 0 ? 1 : 0
            left += 1
        }
    }

    return result
}

print(numberOfSubarrays([1,1,2,1,1], 3))
print(numberOfSubarrays([2,4,6], 1))
print(numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2))