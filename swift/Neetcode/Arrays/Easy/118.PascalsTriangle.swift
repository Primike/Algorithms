//Given an integer numRows, return the first numRows of Pascal's triangle.


func generate(_ numRows: Int) -> [[Int]] {
    var result = [[1]]

    for i in 1..<numRows {
        var helper = [0] + result[i - 1] + [0]
        var array = [Int]()

        for j in 0...i {
            array.append(helper[j] + helper[j + 1])
        }

        result.append(array)
    }

    return result
}

print(generate(5))
print(generate(1))


func generate2(_ numRows: Int) -> [[Int]] {        
    var result = [[1]]
    
    for _ in 1..<numRows {
        let lastRow = result.last!
        let newRow = zip([0] + lastRow, lastRow + [0]).map(+)
        result.append(newRow)
    }
    
    return result
}
