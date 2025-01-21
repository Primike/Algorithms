// Given an integer array nums, return an integer array counts 
// where counts[i] is the number of smaller elements to the right of nums[i].

// Time: O(n * logn), Space: O(n)
func countSmaller(_ nums: [Int]) -> [Int] {
    var nums = nums.enumerated().map { ($0, $1) }
    var result = Array(repeating: 0, count: nums.count)

    func mergeSort(_ array: [(Int, Int)]) -> [(Int, Int)] {
        if array.count <= 1 { return array }

        let mid = array.count / 2
        let left = mergeSort(Array(array[..<mid]))
        let right = mergeSort(Array(array[mid...]))

        var merged = [(Int, Int)]()
        var i = 0, j = 0
        var rightCount = 0

        while i < left.count, j < right.count {
            if left[i].1 > right[j].1 {
                rightCount += 1
                merged.append(right[j])
                j += 1
            } else {
                result[left[i].0] += rightCount
                merged.append(left[i])
                i += 1
            }
        }

        while i < left.count {
            result[left[i].0] += rightCount
            merged.append(left[i])
            i += 1
        }

        while j < right.count {
            merged.append(right[j])
            j += 1
        }

        return merged
    }

    mergeSort(nums)
    return result
}

print(countSmaller([5,2,6,1]))
print(countSmaller([-1]))
print(countSmaller([-1,-1]))