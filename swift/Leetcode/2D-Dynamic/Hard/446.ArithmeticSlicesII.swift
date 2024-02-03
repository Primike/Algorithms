// Given an integer array nums, return the number of all the 
// arithmetic subsequences of nums.
// A sequence of numbers is called arithmetic if it consists of at least 
// three elements and if the difference between any 
// two consecutive elements is the same.

func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    if nums.count < 3 { return 0 }

    var dp = Array(repeating: [Int: Int](), count: nums.count)
    var count = 0

    for i in 1..<nums.count {
        for j in 0..<i {
            let difference = nums[i] - nums[j]
            
            let iCount = dp[i][difference] ?? 0
            let jCount = dp[j][difference] ?? 0
            dp[i][difference] = iCount + jCount + 1

            count += jCount
        }
    }

    return count
}

print(numberOfArithmeticSlices([2,4,6,8,10]))
print(numberOfArithmeticSlices([7,7,7,7,7]))