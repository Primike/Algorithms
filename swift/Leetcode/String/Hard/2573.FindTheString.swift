class Solution {
    func findTheString(_ lcp: [[Int]]) -> String {
        let n = lcp.count
        var word = Array(repeating: "", count: n)
        var currentCharValue = UnicodeScalar("a").value

        for i in 0..<n {
            if word[i].isEmpty {
                if currentCharValue > UnicodeScalar("z").value {
                    return ""
                }
                let char = String(UnicodeScalar(currentCharValue)!)
                word[i] = char
                for j in (i + 1)..<n {
                    if lcp[i][j] > 0 {
                        word[j] = char
                    }
                }
                currentCharValue += 1
            }
        }

        for i in stride(from: n - 1, through: 0, by: -1) {
            for j in stride(from: n - 1, through: 0, by: -1) {
                if word[i] != word[j] {
                    if lcp[i][j] > 0 {
                        return ""
                    }
                } else {
                    if i == n - 1 || j == n - 1 {
                        if lcp[i][j] != 1 {
                            return ""
                        }
                    } else {
                        if lcp[i][j] != lcp[i + 1][j + 1] + 1 {
                            return ""
                        }
                    }
                }
            }
        }

        return word.joined()
    }
}