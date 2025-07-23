// Given an array of integers arr, a lucky integer is an integer 
// that has a frequency in the array equal to its value.
// Return the largest lucky integer in the array. 
// If there is no lucky integer return -1.

// Time: O(n), Space: O(n)
func findLucky(_ arr: [Int]) -> Int {
    let dict = arr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = -1

    for (key, value) in dict {
        if key == value { result = max(result, key) }
    }

    return result
}

print(findLucky([2,2,3,4]))
print(findLucky([1,2,2,3,3,3]))
print(findLucky([2,2,2,3,3]))