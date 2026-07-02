class Solution {
    func processStr(_ s: String) -> String {
        var result = [Character]()
        
        for ch in s {
            if ch == "*" {
                if !result.isEmpty {
                    result.removeLast()
                }
            } else if ch == "#" {
                result += result
            } else if ch == "%" {
                result.reverse()
            } else {
                result.append(ch)
            }
        }
        
        return String(result)
    }
}