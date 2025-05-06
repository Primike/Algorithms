// Given a sorted integer array arr, two integers k and x, 
// return the k closest integers to x in the array. 
// The result should also be sorted in ascending order.

// Time: O(log(n) + k), Space: O(1)
func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0, right = arr.count - 1

    while left < right {
        let mid = (right + left) / 2

        if arr[mid] >= x {
            right = mid
        } else if arr[mid] < x {
            left = mid + 1
        }
    }

    right = left
    left = left - 1

    while right - left - 1 < k {
        if right >= arr.count {
            left -= 1
        } else if left >= 0, x - arr[left] <= arr[right] - x  {
            left -= 1
        } else {
            right += 1
        }
    }

    return Array(arr[left + 1...right - 1])
}

print(findClosestElements([1,2,3,4,5], 4, 3))
print(findClosestElements([1,2,3,4,5], 4, -1))