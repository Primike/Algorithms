class Solution {
    func numberOfSpecialChars(_ word: String) -> Int {
        var lastLow = [Character: Int]()
        var firstUp = [Character: Int]()
        
        for (i, c) in word.enumerated() {
            if c.isLowercase {
                lastLow[c] = i
            } else {
                if firstUp[c] == nil {
                    firstUp[c] = i
                }
            }
        }
        
        var ans = 0
        let asciiLowercase = "abcdefghijklmnopqrstuvwxyz"
        
        for c in asciiLowercase {
            let upC = Character(c.uppercased())
            
            if let lastLowIdx = lastLow[c], 
               let firstUpIdx = firstUp[upC], 
               lastLowIdx < firstUpIdx {
                ans += 1
            }
        }
        
        return ans
    }
}