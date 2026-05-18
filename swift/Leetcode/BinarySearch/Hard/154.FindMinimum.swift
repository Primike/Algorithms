class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var low = 0
        var high = nums.count - 1
        
        while high > low {
            let pivot = low + (high - low) / 2
            
            if nums[pivot] < nums[high] {
                high = pivot
            } else if nums[pivot] > nums[high] {
                low = pivot + 1
            } else {
                high -= 1
            }
        }
        
        return nums[low]
    }
}