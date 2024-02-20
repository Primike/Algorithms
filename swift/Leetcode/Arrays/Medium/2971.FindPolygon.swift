// Return the largest possible perimeter of a polygon 
// whose sides can be formed from nums, or -1 
// if it is not possible to create a polygon.

// Time: O(n * logn), Space: O(1)
func largestPerimeter(_ nums: [Int]) -> Int {
    let nums = nums.sorted()
    var result = -1
    var perimeter = nums[0] + nums[1]

    for i in 2..<nums.count {
        perimeter += nums[i]
        if perimeter - nums[i] > nums[i] { result = perimeter }
    }

    return result
}

print(largestPerimeter([5,5,5]))
print(largestPerimeter([1,12,1,2,5,50,3]))
print(largestPerimeter([5,5,50]))