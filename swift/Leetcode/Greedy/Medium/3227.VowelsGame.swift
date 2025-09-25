class Solution {
    func doesAliceWin(_ s: String) -> Bool {
        return s.contains { "aeiou".contains($0) }
    }
}