// Given an integer rowIndex, 
// return the rowIndexth (0-indexed) row of the Pascal's triangle.

// Time: O(n^2), Space: O(n)
func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex <= 0 { return [1] }

    var result = [1, 1]

    for i in 0..<max(0, rowIndex - 1) {
        var newRow = [1]

        for j in 1..<result.count {
            newRow.append(result[j] + result[j - 1])
        }

        result = newRow + [1]
    }

    return result
}

print(getRow(3))
print(getRow(0))
print(getRow(1))