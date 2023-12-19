// Given an integer array nums, return an array answer such that answer[i] is 
// equal to the product of all the elements of nums except nums[i].

func productExceptSelf(_ nums: [Int]) -> [Int] {
    var result = [Int](repeating: 1, count: nums.count)
    var left = 0, right = nums.count - 1
    var preProduct = 1, postProduct = 1

    while left < nums.count, right >= 0 {
        result[left] *= preProduct
        result[right] *= postProduct
        preProduct *= nums[left]
        postProduct *= nums[right]

        left += 1
        right -= 1
    }

    return result
}

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf([-1,1,0,-3,3]))