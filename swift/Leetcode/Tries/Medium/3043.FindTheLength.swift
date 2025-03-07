// You need to find the length of the longest common prefix between all pairs 
// of integers (x, y) such that x belongs to arr1 and y belongs to arr2.
// Return the length of the longest common prefix among all pairs. 
// If no common prefix exists among them, return 0.

// Time: O(n * log10(m) + m * log10(n))
func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
    var arr1Prefixes = Set<Int>()

    for var value in arr1 {
        while !arr1Prefixes.contains(value), value > 0 {
            arr1Prefixes.insert(value)
            value /= 10
        }
    }

    var result = 0

    for var value in arr2 {
        while !arr1Prefixes.contains(value), value > 0 {
            value /= 10
        }

        if value > 0 { result = max(result, String(value).count) }
    }

    return result
}

print(longestCommonPrefix([1,10,100], [1000]))
print(longestCommonPrefix([1,2,3], [4,4,4]))