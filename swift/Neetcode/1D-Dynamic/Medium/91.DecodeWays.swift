// Given a string s containing only digits, return the number of ways to decode it.

// Time: O(n), Space: O(n)
func numDecodings(_ s: String) -> Int {
    if s.first == "0" { return 0 }
    
    let s = Array(s)
    var tab = Array(repeating: 0, count: s.count + 1)
    tab[0] = 1
    
    for i in 0..<s.count {
        if s[i] == "0" { continue }
        
        tab[i + 1] += tab[i]

        if i < s.count - 1, Int("\(s[i])\(s[i + 1])")! <= 26 { 
            tab[i + 2] += tab[i] 
        }
    }
    
    return tab[tab.count - 1]
}

print(numDecodings("12"))
print(numDecodings("226"))
print(numDecodings("06"))

func numDecodings2(_ s: String) -> Int {
    let s = Array(s)
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i == s.count { return 1 }
        if s[i] == "0" { return 0 }
        if let value = memo[i] { return value }

        var count = dp(i + 1)

        if i + 1 < s.count, Int("\(s[i])\(s[i + 1])")! <= 26 {
            count += dp(i + 2)
        }

        memo[i] = count
        return count
    }

    return dp(0)
}