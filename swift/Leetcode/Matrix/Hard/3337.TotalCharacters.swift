let MOD = 1_000_000_007
let L = 26

class Mat {
    var a: [[Int]]

    init(copyFrom: Mat? = nil) {
        self.a = Array(repeating: Array(repeating: 0, count: L), count: L)
        if let source = copyFrom {
            for i in 0..<L {
                for j in 0..<L {
                    self.a[i][j] = source.a[i][j]
                }
            }
        }
    }

    static func * (lhs: Mat, rhs: Mat) -> Mat {
        let result = Mat()
        for i in 0..<L {
            for j in 0..<L {
                var sumForCell: Int = 0
                for k in 0..<L {
                    let product = lhs.a[i][k] * rhs.a[k][j]
                    sumForCell = (sumForCell + product) % MOD
                }
                result.a[i][j] = (sumForCell + MOD) % MOD
            }
        }
        return result
    }
}

func identityMatrix() -> Mat {
    let m = Mat()
    for i in 0..<L {
        m.a[i][i] = 1
    }
    return m
}

func quickmul(x: Mat, y: Int) -> Mat {
    var ans = identityMatrix()
    var cur = x
    var power = y
    while power > 0 {
        if power & 1 == 1 {
            ans = ans * cur
        }
        cur = cur * cur
        power >>= 1
    }
    return ans
}

class Solution {
    func lengthAfterTransformations(_ s: String, _ t: Int, _ nums: [Int]) -> Int {
        let TMat = Mat()
        
        for i in 0..<L {
            if nums[i] > 0 {
                for j in 1...nums[i] {
                TMat.a[(i + j) % L][i] = 1
                }
            }
        }

        let res = quickmul(x: TMat, y: t)

        var f = Array(repeating: 0, count: L)
        if let aAscii = Character("a").asciiValue {
            for char in s {
                if let charAscii = char.asciiValue {
                    let index = Int(charAscii - aAscii)
                    if index >= 0 && index < L {
                        f[index] += 1
                    }
                }
            }
        }
        
        var ans = 0
        for i in 0..<L {
            for j in 0..<L {
                let termProduct = res.a[i][j] * f[j]
                ans = (ans + termProduct) % MOD
            }
        }
        return (ans + MOD) % MOD
    }
}