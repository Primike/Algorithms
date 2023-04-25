def productExceptSelf(nums):
    result = [1] * len(nums)

    left_product = 1
    for i in range(len(nums)):
        result[i] *= left_product
        left_product *= nums[i]
    
    right_product = 1
    for i in range(len(nums) -1, -1, -1):
        result[i] *= right_product
        right_product *= nums[i]

    return result

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf([-1,1,0,-3,3]))