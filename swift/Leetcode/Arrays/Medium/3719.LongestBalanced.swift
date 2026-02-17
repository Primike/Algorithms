// A subarray is called balanced if the number of 
// distinct even numbers in the subarray is equal 
// to the number of distinct odd numbers.
// Return the length of the longest balanced subarray.

// Time: O(n^2), Space: O(n)
func longestBalanced(_ nums: [Int]) -> Int {
    var result = 0

    for i in 0..<nums.count {
        var even = Set<Int>()
        var odd = Set<Int>()

        for j in i..<nums.count {
            let isEven = nums[j] % 2 == 0

            if isEven {
                even.insert(nums[j])
            } else {
                odd.insert(nums[j])
            }

            if even.count == odd.count { result = max(result, j - i + 1) }
        }
    }
    
    return result
}

print(longestBalanced([2,5,4,3]))
print(longestBalanced([3,2,2,5,4]))
print(longestBalanced([1,2,3,2]))