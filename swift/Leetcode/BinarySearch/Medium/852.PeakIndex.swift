// Given a mountain array arr, return the index i such that 
// arr[0] < arr[1] < ... < arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].
// You must solve it in O(log(arr.length)) time complexity.

// Time: O(logn), Space: O(1)
func peakIndexInMountainArray(_ arr: [Int]) -> Int {
    var left = 0, right = arr.count - 1

    while left < right {
        let mid = (right + left) / 2

        if arr[mid] < arr[mid + 1] {
            left = mid + 1
        } else {
            right = mid
        }
    }

    return left
}

print(peakIndexInMountainArray([0,1,0]))
print(peakIndexInMountainArray([0,2,1,0]))
print(peakIndexInMountainArray([0,10,5,2]))