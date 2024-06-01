// Given an integer array nums, in which exactly two elements 
// appear only once and all the other elements appear exactly twice. 
// Find the two elements that appear only once. 
// You can return the answer in any order.
// You must write an algorithm that runs in linear runtime complexity 
// and uses only constant extra space.

func singleNumber(_ nums: [Int]) -> [Int] {
    var xor = 0
    
    for num in nums {
        xor ^= num
    }
    
    let rightmostSetBit = xor & -xor
    var num1 = 0
    var num2 = 0
    
    for num in nums {
        if (num & rightmostSetBit) == 0 {
            num1 ^= num
        } else {
            num2 ^= num
        }
    }
    
    return [num1, num2]
}

print(singleNumber([1,2,1,3,2,5]))
print(singleNumber([-1,0]))
print(singleNumber([0,1]))