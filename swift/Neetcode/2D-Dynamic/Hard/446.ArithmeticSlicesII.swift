// Given an integer array nums, return the number of all the 
// arithmetic subsequences of nums.
// A sequence of numbers is called arithmetic if it consists of at least 
// three elements and if the difference between any 
// two consecutive elements is the same.

// Time: O(n^2), Space: O(n^2)
func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
    var tab = Array(repeating: [Int: Int](), count: nums.count)
    var result = 0

    for i in 0..<tab.count {
        for j in 0..<i {
            let difference = nums[i] - nums[j]
            let countAtJ = tab[j][difference, default: 0]
            
            tab[i][difference, default: 0] += countAtJ + 1
            result += countAtJ
        }
    }

    return result
}

print(numberOfArithmeticSlices([2,4,6,8,10]))
print(numberOfArithmeticSlices([7,7,7,7,7]))