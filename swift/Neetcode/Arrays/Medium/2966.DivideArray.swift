// You are given an integer array nums of size n and a positive integer k.
// Divide the array into one or more arrays of size 3 
// satisfying the following conditions:
// Each element of nums should be in exactly one array.
// The difference between any two elements in one array 
// is less than or equal to k.

// Time: O(n * logn), Space: O(n)
func divideArray(_ nums: [Int], _ k: Int) -> [[Int]] {  
    if nums.count < 3 { return [] }

    let nums = nums.sorted()
    var result = [[Int]]()

    for i in stride(from: 2, to: nums.count, by: 3) {
        if nums[i] - nums[i - 2] > k { return [] }
        result.append(Array(nums[(i - 2)...i]))
    }

    return result
}

print(divideArray([1,3,4,8,7,9,3,5,1], 2))
print(divideArray([1,3,3,2,7,3], 3))