// Return the minimum number of jumps to reach nums[n - 1]. 
// The test cases are generated such that you can reach nums[n - 1].

// Time: O(n), Space: O(1)
func jump(_ nums: [Int]) -> Int {
    var result = 0
    var lastBound = 0, nextBound = 0

    for i in 0..<nums.count - 1 {
        nextBound = max(nextBound, i + nums[i])

        if lastBound == i {
            lastBound = nextBound
            result += 1 
        }
    }

    return result
}

print(jump([2,3,1,1,4]))
print(jump([2,3,0,1,4]))