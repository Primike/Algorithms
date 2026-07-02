class Solution {
    func processStr(_ s: String, _ k: Int) -> String {
        var length = 0
        var currentK = k
        
        for c in s {
            if c == "*" {
                if length > 0 {
                    length -= 1
                }
            } else if c == "#" {
                length *= 2
            } else if c == "%" {
                continue
            } else {
                length += 1
            }
        }
        
        if currentK + 1 > length {
            return "."
        }
        
        for c in s.reversed() {
            if c == "*" {
                length += 1
            } else if c == "#" {
                if currentK + 1 > (length + 1) / 2 {
                    currentK -= length / 2
                }
                length = (length + 1) / 2
            } else if c == "%" {
                currentK = length - currentK - 1
            } else {
                if currentK + 1 == length {
                    return String(c)
                }
                length -= 1
            }
        }
        
        return "."
    }
}