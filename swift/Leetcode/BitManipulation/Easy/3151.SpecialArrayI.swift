// An array is considered special if every pair of its 
// adjacent elements contains two numbers with different parity.
// You are given an array of integers nums. Return true 
// if nums is a special array, otherwise, return false.

func isArraySpecial(_ nums: [Int]) -> Bool {
    for index in 0..<nums.count - 1 {
        if nums[index] % 2 == nums[index + 1] % 2 { return false }
    }
    
    return true
}

print(isArraySpecial([1]))
print(isArraySpecial([2,1,4]))
print(isArraySpecial([4,3,1,6]))