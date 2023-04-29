//Given an array of integers nums, sort the array in 
//ascending order and return it.

func sortArray(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }

    let mid = nums.count / 2

    let left = Array(nums[..<mid])
    let right = Array(nums[mid...])

    let sortedLeft = sortArray(left)
    let sortedRight = sortArray(right)

    return merge(sortedLeft, sortedRight)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    var i = 0
    var j = 0

    while i < left.count && j < right.count {
        if left[i] < right[j] {
            result.append(left[i])
            i += 1
        } else {
            result.append(right[j])
            j += 1
        }
    }

    while i < left.count {
        result.append(left[i])
        i += 1
    }

    while j < right.count {
        result.append(right[j])
        j += 1
    }

    return result
}

print(sortArray([5,2,3,1]))
print(sortArray([5,1,1,2,0,0]))


func mergeSort(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }

    let mid = nums.count / 2
    let left = Array(nums[..<mid])
    let right = Array(nums[mid...])
    let sortedLeft = mergeSort(left)
    let sortedRight = mergeSort(right)

    var result = [Int]()
    var i = 0
    var j = 0

    while i < sortedLeft.count && j < sortedRight.count {
        if sortedLeft[i] < sortedRight[j] {
            result.append(sortedLeft[i])
            i += 1
        } else {
            result.append(sortedRight[j])
            j += 1
        }
    }

    while i < sortedLeft.count {
        result.append(sortedLeft[i])
        i += 1
    }

    while j < sortedRight.count {
        result.append(sortedRight[j])
        j += 1
    }

    return result
}
