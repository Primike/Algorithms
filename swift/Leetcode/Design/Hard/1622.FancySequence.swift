
class Fancy {
    private let mod: Int64 = 1_000_000_007
    private var v: [Int64] = []
    private var a: Int64 = 1
    private var b: Int64 = 0

    init() {}

    private func power(_ x: Int64, _ y: Int64) -> Int64 {
        var res: Int64 = 1
        var base = x % mod
        var exp = y
        while exp > 0 {
            if exp % 2 == 1 {
                res = (res * base) % mod
            }
            base = (base * base) % mod
            exp /= 2
        }
        return res
    }

    private func inv(_ x: Int64) -> Int64 {
        return power(x, mod - 2)
    }

    func append(_ val: Int) {
        let val64 = Int64(val)
        let stored = ((val64 - b + mod) % mod * inv(a)) % mod
        v.append(stored)
    }

    func addAll(_ inc: Int) {
        b = (b + Int64(inc)) % mod
    }

    func multAll(_ m: Int) {
        let m64 = Int64(m)
        a = (a * m64) % mod
        b = (b * m64) % mod
    }

    func getIndex(_ idx: Int) -> Int {
        if idx >= v.count {
            return -1
        }
        return Int((a * v[idx] + b) % mod)
    }
}