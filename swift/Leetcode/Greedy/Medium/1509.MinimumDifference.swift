// You are given an integer array nums.
// In one move, you can choose one element of nums and 
// change it to any value.
// Return the minimum difference between the largest 
// and smallest value of nums after performing at most three moves.

// Time: O(n * log(n)), Space: O(1)
func minDifference(_ nums: [Int]) -> Int {
    if nums.count <= 4 { return 0 }

    let nums = nums.sorted()
    let case1 = nums[nums.count - 4] - nums[0] 
    let case2 = nums[nums.count - 1] - nums[3] 
    let case3 = nums[nums.count - 3] - nums[1] 
    let case4 = nums[nums.count - 2] - nums[2]

    return min(case1, case2, case3, case4)
}

print(minDifference([5,3,2,4]))
print(minDifference([1,5,0,10,14]))
print(minDifference([3,100,20]))