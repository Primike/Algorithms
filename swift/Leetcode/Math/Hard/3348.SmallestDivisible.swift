class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var x = a
        var y = b
        while y != 0 {
            let t = x % y
            x = y
            y = t
        }
        return x
    }

    func smallestNumber(_ num: String, _ t: Int) -> String {
        var temp = t
        for i in 2...9 {
            while temp % i == 0 {
                temp /= i
            }
        }
        
        if temp > 1 {
            return "-1"
        }
        
        var numList = Array(num)
        let n = numList.count
        var rem = Array(repeating: 0, count: n + 1)
        rem[0] = t
        var pos = n - 1
        
        let zeroChar = Character("0")
        let aZeroValue = Int(zeroChar.asciiValue!)
        
        for i in 0..<n {
            if numList[i] == zeroChar {
                pos = i
                break
            }
            let digit = Int(numList[i].asciiValue!) - aZeroValue
            rem[i + 1] = rem[i] / gcd(rem[i], digit)
        }
        
        if rem[n] == 1 {
            return num
        }
        
        for i in stride(from: pos, through: 0, by: -1) {
            while true {
                let currentVal = Int(numList[i].asciiValue!) - aZeroValue
                let nextVal = currentVal + 1
                if nextVal > 9 {
                    break
                }
                
                let nextCharScalar = UnicodeScalar(aZeroValue + nextVal)!
                numList[i] = Character(nextCharScalar)
                
                var tNow = rem[i] / gcd(rem[i], nextVal)
                var k = 9
                
                for j in stride(from: n - 1, to: i, by: -1) {
                    while tNow % k != 0 {
                        k -= 1
                    }
                    tNow /= k
                    let kScalar = UnicodeScalar(aZeroValue + k)!
                    numList[j] = Character(kScalar)
                }
                
                if tNow == 1 {
                    return String(numList)
                }
            }
        }
        
        var ans = [Character]()
        var originalT = t
        for i in stride(from: 9, through: 2, by: -1) {
            while originalT % i == 0 {
                let charScalar = UnicodeScalar(aZeroValue + i)!
                ans.append(Character(charScalar))
                originalT /= i
            }
        }
        
        let ansStr = String(ans)
        let padding = max(n + 1 - ansStr.count, 0)
        let paddedAns = ansStr + String(repeating: "1", count: padding)
        
        return String(paddedAns.reversed())
    }
}