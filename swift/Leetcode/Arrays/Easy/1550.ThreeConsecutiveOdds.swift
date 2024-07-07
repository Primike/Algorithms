// Given an integer array arr, return true if there are 
// three consecutive odd numbers in the array. Otherwise, return false.

// Time: O(n), Space: O(1)
func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
    if arr.count < 3 { return false }

    for i in 1..<arr.count - 1 {
        if arr[i - 1] % 2 != 0, arr[i] % 2 != 0, arr[i + 1] % 2 != 0 { return true }
    }

    return false
}

print(threeConsecutiveOdds([2,6,4,1]))
print(threeConsecutiveOdds([1,2,34,3,4,5,7,23,12]))