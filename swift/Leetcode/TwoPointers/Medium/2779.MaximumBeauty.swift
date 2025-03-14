func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    var left = 0
    var result = 0

    for i in 0..<nums.count {
        while nums[i] - nums[left] > 2 * k {
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(maximumBeauty([4,6,1,2], 2))
print(maximumBeauty([1,1,1,1], 10))