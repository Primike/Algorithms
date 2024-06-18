// Given a sorted integer array nums and an integer n, 
// add/patch elements to the array such that any number in the range 
// [1, n] inclusive can be formed by the sum of some elements in the array.
// Return the minimum number of patches required.

// Time: O(m + log(n)), Space: O(1)
func minPatches(_ nums: [Int], _ n: Int) -> Int {
    var patches = 0
    var i = 0
    var miss: Int64 = 1 
    
    while miss <= n {
        if i < nums.count, nums[i] <= miss { 
            miss += Int64(nums[i])
            i += 1
        } else { 
            miss += miss
            patches += 1 
        }
    }
    
    return patches
}

print(minPatches([1,3], 6))
print(minPatches([1,5,10], 20))
print(minPatches([1,2,2], 5))