class Solution {
    func minimumDeletions(_ word: String, _ k: Int) -> Int {
        var counts: [Character: Int] = [:]
        for char in word {
            counts[char, default: 0] += 1
        }
        
        if counts.isEmpty {
            return 0
        }
        
        var res = word.count
        
        for a in counts.values {
            var deleted = 0
            for b in counts.values {
                if b < a {
                    deleted += b
                } else if b > a + k {
                    deleted += b - (a + k)
                }
            }
            res = min(res, deleted)
        }
        
        return res
    }
}