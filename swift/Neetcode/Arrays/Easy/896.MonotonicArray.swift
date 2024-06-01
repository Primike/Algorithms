// Given an integer array nums, return true if 
// the given array is monotonic, or false otherwise.

// Time: O(n), Space: O(1)
func isMonotonic(_ nums: [Int]) -> Bool {
    if nums.count <= 1 { return true }
    
    var increasing = true
    var decreasing = true
    
    for i in 1..<nums.count {
        if nums[i] > nums[i - 1] { decreasing = false }
        if nums[i] < nums[i - 1] { increasing = false }
    }
    
    return increasing || decreasing
}

print(isMonotonic([1,2,2,3]))
print(isMonotonic([6,5,4,4]))
print(isMonotonic([1,3,2]))