// Return the minimum number of jumps to reach nums[n - 1]. 
// The test cases are generated such that you can reach nums[n - 1].

// Delays updating currentEnd until all possible 
// farthest have been maximized

// Time: O(n), Space: O(1)
func jump(_ nums: [Int]) -> Int {
    var result = 0, currentEnd = 0, farthest = 0

    for i in 0..<nums.count - 1 {
        farthest = max(farthest, i + nums[i])

        if i == currentEnd {
            result += 1
            currentEnd = farthest
        }
    }

    return result
}

print(jump([2,3,1,1,4]))
print(jump([2,3,0,1,4]))