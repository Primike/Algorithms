// You are given an integer array nums. You need to ensure 
// that the elements in the array are distinct. To achieve this, 
// you can perform the following operation any number of times:
// Remove 3 elements from the beginning of the array. 
// If the array has fewer than 3 elements, remove all remaining elements.
// Note that an empty array is considered to have distinct elements. 
// Return the minimum number of operations needed to make the 
// elements in the array distinct.

// Time: O(n), Space: O(n)
func minimumOperations(_ nums: [Int]) -> Int {
    var numberSet = Set<Int>()

    for i in (0..<nums.count).reversed() {
        if numberSet.contains(nums[i]) { return (i + 3) / 3 }
        numberSet.insert(nums[i])
    }

    return 0
}

print(minimumOperations([1,2,3,4,2,3,3,5,7]))
print(minimumOperations([4,5,6,4,4]))
print(minimumOperations([6,7,8,9]))