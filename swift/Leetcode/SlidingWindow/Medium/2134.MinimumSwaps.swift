// Given a binary circular array nums, return the minimum number 
// of swaps required to group all 1's present 
// in the array together at any location.

// Time: O(n), Space: O(n)
func minSwaps(_ nums: [Int]) -> Int {
    let totalOnes = nums.filter { $0 == 1 }.count
    if totalOnes <= 1 { return 0 }
    
    let nums = nums + nums
    var maxOnes = 0
    var ones = 0
    var left = 0
    
    for i in 0..<nums.count {
        if nums[i] == 1 { ones += 1 }
        
        if i - left + 1 > totalOnes {
            if nums[left] == 1 { ones -= 1 }
            left += 1
        }
        
        if i - left + 1 == totalOnes { maxOnes = max(maxOnes, ones) }
    }
    
    return totalOnes - maxOnes
}

print(minSwaps([0,1,0,1,1,0,0]))
print(minSwaps([0,1,1,1,0,0,1,1,0]))
print(minSwaps([1,1,0,0,1]))