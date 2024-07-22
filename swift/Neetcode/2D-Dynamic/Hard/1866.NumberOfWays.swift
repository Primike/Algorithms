// There are n uniquely-sized sticks whose lengths are integers from 1 to n. 
// You want to arrange the sticks such that exactly k sticks are visible from the left. 
// A stick is visible from the left if there are no longer sticks to the left of it.
// For example, if the sticks are arranged [1,3,2,5,4], 
// then the sticks with lengths 1, 3, and 5 are visible from the left.
// Given n and k, return the number of such arrangements. 

// Time: O(n * k), Space: O(n * k)
func rearrangeSticks(_ n: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var tab = Array(repeating: Array(repeating: 0, count: k + 1), count: n + 1)
    tab[0][0] = 1

    for i in 1...n {
        for j in 1...k {
            if i == j { 
                tab[i][j] = 1
            } else {
                tab[i][j] = (tab[i - 1][j - 1] + (i - 1) * tab[i - 1][j]) % mod
            }
        }
    }

    return tab[n][k]
}

print(rearrangeSticks(3, 2))
print(rearrangeSticks(5, 5))
print(rearrangeSticks(20, 11))


func rearrangeSticks2(_ n: Int, _ k: Int) -> Int {
    let mod = 1_000_000_007
    var memo = [String: Int]()

    func dp(_ n: Int, _ k: Int) -> Int {
        let key = "\(n),\(k)"

        if n == k { return 1 }
        if n == 0 || k == 0 { return 0 }
        if let value = memo[key] { return value }

        let result = (dp(n - 1, k - 1) + (n - 1) * dp(n - 1, k)) % mod
        memo[key] = result
        return result
    }

    return dp(n, k)
}