// Given an integer array nums, return an array answer such that answer[i] is 
// equal to the product of all the elements of nums except nums[i].

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = [Int](repeating: 1, count: nums.count)

    var leftProduct = 1
    for i in 0..<nums.count {
        result[i] *= leftProduct
        leftProduct *= nums[i]
    }

    var rightProduct = 1
    for i in (0..<nums.count).reversed() {
        result[i] *= rightProduct
        rightProduct *= nums[i]
    }

    return result
}

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf([-1,1,0,-3,3]))