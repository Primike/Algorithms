// Given an m x n matrix mat where every row is sorted 
// in strictly increasing order, return the 
// smallest common element in all rows.
// If there is no common element, return -1.

// Time: O(m * n), Space: O(m * n)
func smallestCommonElement(_ mat: [[Int]]) -> Int {
    var dict = [Int: Int]()
    var result = Int.max

    for i in 0..<mat.count {
        for j in 0..<mat[i].count {
            dict[mat[i][j], default: 0] += 1

            if dict[mat[i][j]] == mat.count { 
                result = min(result, mat[i][j])
            }
        }
    }

    return result == .max ? -1 : result
}

print(smallestCommonElement([[1,2,3,4,5],[2,4,5,8,10],[3,5,7,9,11],[1,3,5,7,9]]))
print(smallestCommonElement([[1,2,3],[2,3,4],[2,3,5]]))