class Solution {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        let n = s.count
        var res = s
        let doubledS = Array(s + s)

        func gcd(_ a: Int, _ b: Int) -> Int {
            var a = a
            var b = b
            while b != 0 {
                let temp = b
                b = a % b
                a = temp
            }
            return a
        }

        let g = gcd(b, n)

        var add: (inout [Character], Int) -> Void = { (t, start) in
            var minVal = 10
            var times = 0
            for i in 0..<10 {
                let added = (t[start].wholeNumberValue! + i * a) % 10
                if added < minVal {
                    minVal = added
                    times = i
                }
            }
            for i in stride(from: start, to: n, by: 2) {
                t[i] = Character(String((t[i].wholeNumberValue! + times * a) % 10))
            }
        }

        for i in stride(from: 0, to: n, by: g) {
            var t = Array(doubledS[i..<(i + n)])
            add(&t, 1)
            if b % 2 != 0 {
                add(&t, 0)
            }
            res = min(res, String(t))
        }
        
        return res
    }
}