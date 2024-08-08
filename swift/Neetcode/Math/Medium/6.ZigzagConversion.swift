// The string "PAYPALISHIRING" is written in a zigzag pattern 
// on a given number of rows like this: 
// (you may want to display this pattern in a fixed font for better legibility)
// P   A   H   N
// A P L S I I G
// Y   I   R
// And then read line by line: "PAHNAPLSIIGYIR"
// Write the code that will take a string and make this conversion given a number of rows:

// Time: O(n + numRows * n), Space: O(numRows * n)
func convert(_ s: String, _ numRows: Int) -> String {
    let s = Array(s).map { String($0) }
    let inBetweenCount = max(0, numRows - 2)
    var zigzag = [[String]]()
    var i = 0

    while i < s.count {
        var col = Array(repeating: "", count: numRows)
        var j = 0

        while i < s.count, j < numRows {
            col[j] = s[i]
            i += 1
            j += 1
        }

        zigzag.append(col)
    
        for k in 0..<inBetweenCount {
            if i == s.count { break }

            var inBetweenArray = Array(repeating: "", count: numRows)
            inBetweenArray[numRows - k - 2].append(s[i])
            zigzag.append(inBetweenArray)
            i += 1
        }
    }

    var result = ""

    for r in 0..<numRows {
        for c in 0..<zigzag.count {
            result += zigzag[c][r]
        }
    }

    return result
}

print(convert("PAYPALISHIRING", 3))
print(convert("PAYPALISHIRING", 4))