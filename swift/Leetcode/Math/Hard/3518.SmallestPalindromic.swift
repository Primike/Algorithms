class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a, y = b
        while y != 0 {
            let t = x % y
            x = y
            y = t
        }
        return x
    }

    func smallestPalindrome(_ s: String, _ k: Int) -> String {
        func comb(_ n: Int, _ m: Int, _ kLimit: Int) -> Int {
            let minM = min(m, n - m)
            if minM <= 0 { return 1 }
            
            var res = 1
            for i in 1...minM {
                let g = gcd(res, i)
                let resDiv = res / g
                let iDiv = i / g
                let num = (n - i + 1) / iDiv
                
                let (nextRes, overflow) = resDiv.multipliedReportingOverflow(by: num)
                if overflow || nextRes > kLimit {
                    return kLimit + 1
                }
                res = nextRes
            }
            return res
        }

        let sChars = Array(s)
        let n = sChars.count
        let partition = n / 2
        var bucket = Array(repeating: 0, count: 26)
        let aValue = Int(Character("a").asciiValue!)

        for i in 0..<partition {
            let idx = Int(sChars[i].asciiValue!) - aValue
            bucket[idx] += 1
        }

        func safeMultiply(_ a: Int, _ b: Int, _ limit: Int) -> Int {
            if a == 0 || b == 0 { return 0 }
            if a > limit / b { return limit + 1 }
            return a * b
        }

        func permutations(_ remaining: Int) -> Int {
            var rem = remaining
            var ways = 1
            for i in 0..<26 {
                if bucket[i] == 0 { continue }
                
                let c = comb(rem, bucket[i], k)
                ways = safeMultiply(ways, c, k)
                if ways > k {
                    break
                }
                rem -= bucket[i]
            }
            return ways
        }

        var leftChars = [Character]()
        var startIndex = 1

        for pos in 0..<partition {
            for i in 0..<26 {
                if bucket[i] == 0 { continue }

                bucket[i] -= 1

                let ways = permutations(partition - pos - 1)
                if k - startIndex < ways {
                    let charScalar = UnicodeScalar(aValue + i)!
                    leftChars.append(Character(charScalar))
                    break
                }

                bucket[i] += 1
                if k - startIndex < ways {
                    startIndex = k + 1
                } else {
                    startIndex += ways
                }
            }
        }

        if leftChars.count < partition {
            return ""
        }

        let mid: String
        if n % 2 != 0 {
            mid = String(sChars[partition])
        } else {
            mid = ""
        }

        let leftStr = String(leftChars)
        let rightStr = String(leftStr.reversed())

        return leftStr + mid + rightStr
    }
}