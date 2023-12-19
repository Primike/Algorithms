// Given an integer numRows, return the first numRows of Pascal's triangle.

func generate(_ numRows: Int) -> [[Int]] {
    var result = [[1]]

    for _ in 1..<numRows {
        let last = result.last!
        var current = [last[0]]

        for i in 0..<last.count  {
            let next = i < last.count - 1 ? last[i + 1] : 0
            current.append(last[i] + next)
        }

        result.append(current)
    }

    return result
}

print(generate(5))
print(generate(1))