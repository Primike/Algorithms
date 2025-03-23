// You can do the following operation on the array 
// any number of times (possibly zero):
// Choose any 3 consecutive elements from the array and flip all of them.
// Flipping an element means changing its value from 0 to 1, and from 1 to 0.
// Return the minimum number of operations required 
// to make all elements in nums equal to 1. If it is impossible, return -1.

// Time: O(n), Space: O(1)
func minOperations(_ nums: [Int]) -> Int {
    var nums = nums
    var result = 0

    for i in 0..<nums.count {
        if nums[i] == 0, i + 2 < nums.count {
            nums[i] = 1
            nums[i + 1] = nums[i + 1] == 1 ? 0 : 1
            nums[i + 2] = nums[i + 2] == 1 ? 0 : 1
            result += 1
        }
    }

    return nums.filter { $0 == 0 }.count == 0 ? result : -1
}

print(minOperations([0,1,1,1,0,0]))
print(minOperations([0,1,1,1]))