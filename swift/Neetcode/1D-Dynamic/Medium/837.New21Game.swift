// Return the probability that Alice has n or fewer points.

// Time: O(n), Space: O(n)
func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
    if k == 0 || n >= k + maxPts { return 1.0 }
    
    var tab = Array(repeating: 0.0, count: n + 1)
    tab[0] = 1.0    
    var probability = 1.0
    
    for i in 1...n {
        tab[i] = probability / Double(maxPts)
        
        if i < k { probability += tab[i] }
        if i >= maxPts { probability -= tab[i - maxPts] }
    }
    
    return tab[k...n].reduce(0, +)
}

print(new21Game(10, 1, 10))
print(new21Game(6, 1, 10))
print(new21Game(21, 17, 10))

// TLE
func new21Game2(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
    var memo = [Int: Double]()

    func dp(_ points: Int) -> Double {
        if points >= k { return points <= n ? 1.0 : 0.0 }
        if let value = memo[points] { return value }

        var result = 0.0
        let probability = 1.0 / Double(maxPts)

        for i in 1...maxPts {
            result += dp(points + i) * probability
        }

        memo[points] = result
        return result
    }

    return dp(0)
}