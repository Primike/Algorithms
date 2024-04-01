// Given an integer array nums, find a subarray
// that has the largest product, and return the product.

// For both at every number streak will continue or end
// currentMax: continuation, use left negative, start new
// [...] + [n], -[...] + [-n], [N]
// currentMin: continuation, use left negative, start new
// [...] + [-n], -[...] + [-n], [-N]

// Time: O(n), Space: O(1)
func maxProduct(_ nums: [Int]) -> Int {
    var result = nums[0]
    var currentMin = 1, currentMax = 1

    for number in nums {
        let temp = currentMax * number

        currentMax = max(number * currentMax, number * currentMin, number)
        currentMin = min(temp, number * currentMin, number)

        result = max(result, currentMax)
    }
    
    return result
}

print(maxProduct([2,3,-2,4]))
print(maxProduct([-2,0,-1]))