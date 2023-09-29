// You are given an integer array nums. You are
// initially positioned at the array's first index, and each element 
// in the array represents your maximum jump length at that position.
// Return true if you can reach the last index, or false otherwise.

func canJump(_ nums: [Int]) -> Bool {
    var jumpPoint = 0

    for (i, number) in nums.enumerated() {
        if jumpPoint < i { return false }
        
        jumpPoint = max(jumpPoint, i + number)
    }

    return jumpPoint >= nums.count - 1
}

print(canJump([2,3,1,1,4]))
print(canJump([3,2,1,0,4]))