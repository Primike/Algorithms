class Solution {
    func canBeEqual(_ s1: String, _ s2: String) -> Bool {
        let s1Chars = Array(s1)
        let s2Chars = Array(s2)

        let evenMatch = (s1Chars[0] == s2Chars[0] && s1Chars[2] == s2Chars[2]) || 
                        (s1Chars[0] == s2Chars[2] && s1Chars[2] == s2Chars[0])
        
        let oddMatch = (s1Chars[1] == s2Chars[1] && s1Chars[3] == s2Chars[3]) || 
                       (s1Chars[1] == s2Chars[3] && s1Chars[3] == s2Chars[1])

        return evenMatch && oddMatch
    }
}