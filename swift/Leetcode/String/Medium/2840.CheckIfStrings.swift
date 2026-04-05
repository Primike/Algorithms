class Solution {
    func checkStrings(_ s1: String, _ s2: String) -> Bool {
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)
        
        func getCounts(_ chars: [Character], _ start: Int) -> [Character: Int] {
            var counts = [Character: Int]()
            for i in stride(from: start, to: chars.count, by: 2) {
                counts[chars[i], default: 0] += 1
            }
            return counts
        }
        
        return getCounts(s1Chars, 0) == getCounts(s2Chars, 0) &&
               getCounts(s1Chars, 1) == getCounts(s2Chars, 1)
    }
}