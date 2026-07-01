class Solution {
    func mapWordWeights(_ words: [String], _ weights: [Int]) -> String {
        var ans = [String]()
        let asciiA = Character("a").asciiValue!
        let asciiZ = Character("z").asciiValue!
        
        for word in words {
            var s = 0
            for c in word {
                if let asciiC = c.asciiValue {
                    let index = Int(asciiC - asciiA)
                    s += weights[index]
                }
            }
            
            let targetAscii = Int(asciiZ) - (s % 26)
            if let scalar = UnicodeScalar(targetAscii) {
                ans.append(String(Character(scalar)))
            }
        }
        
        return ans.joined()
    }
}