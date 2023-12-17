// You are given a 0-indexed array nums of distinct integers. 
// You want to rearrange the elements in the array such that every element 
// in the rearranged array is not equal to the average of its neighbors.

func rearrangeArray(_ nums: [Int]) -> [Int] {
    let nums = nums.sorted()
    var result = [Int]()
    var left = 0, right = nums.count - 1

    while left <= right {
        result.append(nums[left])
        if right != left { result.append(nums[right]) }

        left += 1
        right -= 1
    }

    return result
}

print(rearrangeArray([1,2,3,4,5]))
print(rearrangeArray([6,2,0,9,7]))