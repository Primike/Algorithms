// Given an array of integer arrays arrays where each arrays[i] 
// is sorted in strictly increasing order, 
// return an integer array representing the 
// longest common subsequence between all the arrays.

// Time: O(n * m)
func longestCommonSubsequence(_ arrays: [[Int]]) -> [Int] {
    var arrays = arrays.map { Set($0) }
    var current = arrays[0]

    for i in 1..<arrays.count {
        for number in current {
            if !arrays[i].contains(number) { current.remove(number) }
        }
    }

    return Array(current).sorted()
}

print(longestCommonSubsequence([[1,3,4], [1,4,7,9]]))
print(longestCommonSubsequence([[2,3,6,8], [1,2,3,5,6,7,10], [2,3,4,6,9]]))
print(longestCommonSubsequence([[1,2,3,4,5], [6,7,8]]))