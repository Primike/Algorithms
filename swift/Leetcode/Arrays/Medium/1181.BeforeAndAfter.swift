class Solution {
    func beforeAndAfterPuzzles(_ phrases: [String]) -> [String] {
        let n = phrases.count
        var sp: [(String, String)] = []
        
        for phrase in phrases {
            let words = phrase.split(separator: " ").map(String.init)
            if let first = words.first, let last = words.last {
                sp.append((first, last))
            }
        }
        
        var resultSet = Set<String>()
        
        for i in 0..<n {
            for j in 0..<n {
                if i == j {
                    continue
                }
                
                if sp[i].0 == sp[j].1 {
                    let firstWord = sp[i].0
                    let startIndex = phrases[i].index(phrases[i].startIndex, offsetBy: firstWord.count)
                    let combined = phrases[j] + phrases[i][startIndex...]
                    resultSet.insert(combined)
                }
            }
        }
        
        return Array(resultSet).sorted()
    }
}