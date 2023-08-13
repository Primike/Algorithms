//You are given a 0-indexed array nums of distinct integers. 
//You want to rearrange the elements in the array such that every element 
//in the rearranged array is not equal to the average of its neighbors.

func rearrangeArray(_ nums: [Int]) -> [Int] {
    var nums = nums.sorted()
    var result = [Int]()
    var left = 0, right = nums.count - 1

    while result.count != nums.count {
        result.append(nums[left])
        left += 1

        if left <= right {
            result.append(nums[right])
            right -= 1 
        }
    }

    return result
}

print(rearrangeArray([1,2,3,4,5]))
print(rearrangeArray([6,2,0,9,7]))