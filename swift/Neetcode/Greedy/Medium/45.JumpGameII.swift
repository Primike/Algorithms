// Return the minimum number of jumps to reach nums[n - 1]. 
// The test cases are generated such that you can reach nums[n - 1].

func jump(_ nums: [Int]) -> Int {
    var left = 0, right = 0
    var result = 0

    while right < (nums.count - 1) {
        var maxJump = 0

        for i in left...right {
            maxJump = max(maxJump, i + nums[i])
        }

        left = right + 1
        right = maxJump
        result += 1
    }
    
    return result
}

print(jump([2,3,1,1,4]))
print(jump([2,3,0,1,4]))