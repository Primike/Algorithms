// You are painting a fence of n posts with k different colors. 
// You must paint the posts following these rules:
// Every post must be painted exactly one color.
// There cannot be three or more consecutive posts with the same color.
// Given the two integers n and k, return the number of ways you can paint the fence.

// Time: O(n), Space: O(n)
func numWays(_ n: Int, _ k: Int) -> Int {
    if n == 1 { return k }
    if n == 2 { return k * k }

    var one = k, two = k * k

    for i in 2..<n {
        let next = (k - 1) * (one + two)
        one = two 
        two = next
    }

    return two
}

print(numWays(3, 2))
print(numWays(1, 1))
print(numWays(7, 2))


func numWays2(_ n: Int, _ k: Int) -> Int {
    if n == 1 { return k }
    if n == 2 { return k * k }

    var tab = Array(repeating: 0, count: n)
    tab[0] = k
    tab[1] = k * k

    for i in 2..<tab.count {
        tab[i] = (k - 1) * (tab[i - 1] + tab[i - 2])
    }

    return tab[n - 1]
}

// Current state f(i) is the sum:
// Paint_Different_Than_Last = (k - 1) * f(i - 1)
// Paint_Same_As_Last = (k - 1) * f(i - 2).
// To paint f(i) the same color as f(i - 1) f(i - 2) must be different color

func numWays3(_ n: Int, _ k: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if n == 1 { return k }
        if n == 2 { return k * k }
        if let value = memo[n] { return value }

        var result = (k - 1) * (dp(n - 1) + dp(n - 2))
        
        memo[n] = result
        return result
    }

    return dp(n)
}