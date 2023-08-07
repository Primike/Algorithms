//Pick the scores of any k students from the array so that the difference 
//between the highest and the lowest of the k scores is minimized.

func minimumDifference(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    var result = Int.max
    var left = 0

    for i in (k - 1)..<nums.count {
        result = min(result, nums[i] - nums[left])
        left += 1
    }

    return result
}

print(minimumDifference([90], 1))
print(minimumDifference([9,4,1,7], 2))