// You are given an integer array nums. You are
// initially positioned at the array's first index, and each element 
// in the array represents your maximum jump length at that position.
// Return true if you can reach the last index, or false otherwise.

// Time: O(n), Space: O(1)
func canJump(_ nums: [Int]) -> Bool {
    var farthest = 0

    for (i, number) in nums.enumerated() {
        if farthest < i { return false }
        farthest = max(farthest, i + number)
    }

    return true
}

print(canJump([2,3,1,1,4]))
print(canJump([3,2,1,0,4]))