// Given a binary array nums and an integer k, 
// return the maximum number of consecutive 1's in the array 
// if you can flip at most k 0's.

// Time: O(n), Space: O(1)
func longestOnes(_ nums: [Int], _ k: Int) -> Int {
    var result = 0
    var left = 0
    var zeros = 0

    for i in 0..<nums.count {
        if nums[i] == 0 { zeros += 1 }

        while left <= i, zeros > k {
            if nums[left] == 0 { zeros -= 1 }
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(longestOnes([1,1,1,0,0,0,1,1,1,1,0], 2))
print(longestOnes([0,0,1,1,0,0,1,1,1,0,1,1,0,0,0,1,1,1,1], 3))