// Given an array of n integers nums and an integer target, 
// find the number of index triplets i, j, k 
// with 0 <= i < j < k < n that satisfy the condition 
// nums[i] + nums[j] + nums[k] < target.

// Time: O(n^3), Space: O(1)
func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
    var nums = nums.sorted()
    var result = 0

    for i in 0..<nums.count {
        var j = i + 1, k = nums.count - 1

        while j < k {
            let sum = nums[i] + nums[j] + nums[k] 

            if sum < target {
                result += k - j
                j += 1
            } else {
                k -= 1
            }
        }
    }
    
    return result
}

print(threeSumSmaller([-2,0,1,3], 2))
print(threeSumSmaller([], 0))
print(threeSumSmaller([0], 0))