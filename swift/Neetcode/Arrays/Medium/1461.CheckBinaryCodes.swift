// Given a binary string s and an integer k, return true 
// if every binary code of length k is a substring of s. 
// Otherwise, return false.

func hasAllCodes(_ s: String, _ k: Int) -> Bool {
    if s.count < k { return false }
    
    let s = Array(s)
    var codeSet = Set<String>()
    
    for i in 0..<(s.count - k + 1) {
        codeSet.insert(String(s[i..<(i + k)]))
    }

    return codeSet.count == Int(pow(2.0, Double(k)))
}

print(hasAllCodes("00110110", 2))
print(hasAllCodes("0110", 1))
print(hasAllCodes("0110", 2))