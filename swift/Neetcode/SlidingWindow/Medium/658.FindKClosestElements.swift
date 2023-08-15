// Given a sorted integer array arr, two integers k and x, 
// return the k closest integers to x in the array. 
// The result should also be sorted in ascending order.

func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
    var left = 0, right = arr.count - 1

    while left < right {
        let midpoint = left + (right - left) / 2

        if arr[midpoint] >= x {
            right = midpoint
        } else {
            left = midpoint + 1
        }
    }

    right = left
    left = left - 1

    while right - left - 1 < k {
        if left < 0 || (right < arr.count && abs(arr[right] - x) < abs(arr[left] - x)) {
            right += 1
        } else {
            left -= 1
        }
    }

    return Array(arr[(left + 1)...(right - 1)])
}

print(findClosestElements([1,2,3,4,5], 4, 3))
print(findClosestElements([1,2,3,4,5], 4, -1))