// You are given an integer array nums. In one operation, 
// you can add or subtract 1 from any element of nums.
// Return the minimum number of operations to make all 
// elements of nums divisible by 3.

// Time: O(n), Space: O(1)
func minimumOperations(_ nums: [Int]) -> Int {
    var result = 0

    for number in nums {
        let remainder = number % 3
        let operations = remainder == 0 ? 0 : 1
        result += operations
    }

    return result
}

print(minimumOperations([1,2,3,4]))
print(minimumOperations([3,6,9]))