// Given n orders, each order consists of a pickup and a delivery service.
// Count all valid pickup/delivery possible sequences such that delivery(i) 
// is always after of pickup(i). 
// Since the answer may be too large, return it modulo 10^9 + 7.

func countOrders(_ n: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ n: Int, _ m: Int) -> Int {
        let key = "\(n),\(m)"

        if n == 0, m == 0 { return 1 }
        if n < 0 || m < 0 || m < n { return 0 }
        if let value = memo[key] { return value }

        var result = n * dp(n - 1, m) % mod
        result = (result + (m - n) * dp(n, m - 1)) % mod

        memo[key] = result
        return result
    }

    return dp(n, n)
}

print(countOrders(1))
print(countOrders(2))
print(countOrders(3))