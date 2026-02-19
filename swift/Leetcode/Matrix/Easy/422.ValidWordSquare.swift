class Solution {
    func validWordSquare(_ words: [String]) -> Bool {
        let words = words.map { Array($0) }

        for i in 0..<words.count {
            for j in 0..<words[i].count {
                if j >= words.count || i >= words[j].count { return false }
                if words[i][j] != words[j][i] { return false }
            }
        }

        return true
    }
}