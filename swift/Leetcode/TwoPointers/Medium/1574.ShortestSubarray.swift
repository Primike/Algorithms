// Given an integer array arr, remove a subarray (can be empty) 
// from arr such that the remaining elements in arr are non-decreasing.
// Return the length of the shortest subarray to remove.

// Time: O(n), Space: O(1)
func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
    var left = 0

    while left + 1 < arr.count, arr[left] <= arr[left + 1] {
        left += 1
    }

    if left == arr.count - 1 { return 0 }

    var right = arr.count - 1

    while right > 0, arr[right - 1] <= arr[right] {
        right -= 1
    }

    var result = min(arr.count - left - 1, right)
    var i = 0
    var j = right
    
    while i <= left, j < arr.count {
        if arr[i] <= arr[j] {
            result = min(result, j - i - 1)
            i += 1
        } else {
            j += 1
        }
    }

    return result
}

print(findLengthOfShortestSubarray([1,2,3,10,4,2,3,5]))
print(findLengthOfShortestSubarray([5,4,3,2,1]))
print(findLengthOfShortestSubarray([1,2,3]))