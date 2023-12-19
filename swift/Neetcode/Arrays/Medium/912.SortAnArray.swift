// Given an array of integers nums, sort the array in 
// ascending order and return it.

func sortArray(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 { return nums }

    let mid = nums.count / 2
    let left = sortArray(Array(nums[..<mid]))
    let right = sortArray(Array(nums[mid...]))

    var result = [Int]()
    var l = 0, r = 0

    while l < left.count && r < right.count {
        if right[r] > left[l] {
            result.append(left[l])
            l += 1
        } else {
            result.append(right[r])
            r += 1
        }
    }

    return result + left[l...] + right[r...]
}

print(sortArray([5,2,3,1]))
print(sortArray([5,1,1,2,0,0]))