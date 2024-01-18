// Given an array of integers arr, return true if the number of 
// occurrences of each value in the array is unique or false otherwise.

// Time: O(n), Space: O(n)
func uniqueOccurrences(_ arr: [Int]) -> Bool {
    let dict = arr.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    
    return Set(dict.values).count == dict.values.count
}

print(uniqueOccurrences([1,2,2,1,1,3]))
print(uniqueOccurrences([1,2]))
print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0]))