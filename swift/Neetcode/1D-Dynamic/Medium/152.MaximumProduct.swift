// Given an integer array nums, find a subarray
// that has the largest product, and return the product.

//negative and currentMax swap at negatives
func maxProduct(_ nums: [Int]) -> Int {
    var result = nums[0]
    var negative = 1, currentMax = 1

    for n in nums {
        currentMax = max(n * currentMax, n * negative, n)
        negative = min(n * currentMax, n * negative, n)

        result = max(result, currentMax)
    }
    
    return result
}

print(maxProduct([2,3,-2,4]))
print(maxProduct([-2,0,-1]))