// Given a string s, find two disjoint palindromic subsequences of s 
// such that the product of their lengths is maximized. 
// The two subsequences are disjoint if they do not both pick a character at the same index.

// Time: O(3^n), Space: O(n)
func maxProduct(_ s: String) -> Int {
    let s = Array(s)
    var result = 1

    func getProduct(_ a: [Character], _ b: [Character]) -> Int {
        if a != Array(a.reversed()) || b != Array(b.reversed()) { return 0 }
        return a.count * b.count
    }

    func backtrack(_ i: Int, _ a: [Character], _ b: [Character]) {            
        if i == s.count { 
            result = max(result, getProduct(a, b))
            return
        }

        backtrack(i + 1, a + [s[i]], b)
        backtrack(i + 1, a, b + [s[i]])
        backtrack(i + 1, a, b)
    }

    backtrack(0, [], [])
    return result
}

print(maxProduct("leetcodecom"))
print(maxProduct("bb"))
print(maxProduct("accbcaxxcxx"))


func maxProduct2(_ s: String) -> Int {
    let n = s.count
    let sArray = Array(s)
    var first = [Int](repeating: 0, count: 1 << n)
    var last = [Int](repeating: 0, count: 1 << n)

    for i in 0..<n {
        for j in 1 << i ..< 1 << (i + 1) {
            first[j] = i
        }
    }

    for i in 0..<n {
        for j in stride(from: 1 << i, to: 1 << n, by: 1 << (i + 1)) {
            last[j] = i
        }
    }

    var cache = [Int: Int]()

    func dp(_ m: Int) -> Int {
        if let cachedValue = cache[m] { return cachedValue }
        if m & (m - 1) == 0 { return m != 0 ? 1 : 0 }
        let l = last[m]
        let f = first[m]
        let lb = 1 << l
        let fb = 1 << f
        let result = max(dp(m - lb), dp(m - fb), dp(m - lb - fb) + (sArray[l] == sArray[f] ? 2 : 0))
        cache[m] = result
        return result
    }

    var ans = 0
    for m in 1..<1 << n {
        ans = max(ans, dp(m) * dp((1 << n) - 1 - m))
    }

    return ans
}