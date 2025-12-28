// You want to delete the columns that are not sorted lexicographically. 
// In the above example (0-indexed), columns 0 ('a', 'b', 'c') 
// and 2 ('c', 'e', 'e') are sorted, while column 1 ('b', 'c', 'a') 
// is not, so you would delete column 1.
// Return the number of columns that you will delete.

// Time: O(n * l), Space: O(n)
func minDeletionSize(_ strs: [String]) -> Int {
    let strs = strs.map { Array($0) }
    var unsortedCols = Set<Int>()
    var result = 0

    for i in 1..<strs.count {
        for j in 0..<strs[i].count {
            if unsortedCols.contains(j) { continue }

            let previous = Int(strs[i - 1][j].asciiValue!) - 97
            let current = Int(strs[i][j].asciiValue!) - 97

            if previous > current {
                result += 1
                unsortedCols.insert(j)
            }
        }
    }

    return result
}

print(minDeletionSize(["cba","daf","ghi"]))
print(minDeletionSize(["a","b"]))
print(minDeletionSize(["zyx","wvu","tsr"]))