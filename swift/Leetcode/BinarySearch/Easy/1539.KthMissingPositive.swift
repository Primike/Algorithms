// Given an array arr of positive integers sorted in a 
// strictly increasing order, and an integer k.
// Return the kth positive integer that is missing from this array.

// Time: O(log(n)), Space: O(1)
func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
    var left = 0, right = arr.count - 1

    while left < right {
        let mid = (right + left) / 2

        if arr[mid] - mid - 1 < k {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    let missing = arr[right] - right - 1
    if k > missing { return k - missing + arr[right] }

    return arr[right] - missing - 1 + k
}

print(findKthPositive([2,3,4,7,11], 5))
print(findKthPositive([1,2,3,4], 2))