// There are n piles of coins on a table. 
// Each pile consists of a positive number of coins of assorted denominations.
// In one move, you can choose any coin on top of any pile, 
// remove it, and add it to your wallet.
// Given a list piles, where piles[i] is a list of integers 
// denoting the composition of the ith pile from top to bottom, 
// and a positive integer k, return the maximum total value of coins 
// you can have in your wallet if you choose exactly k coins optimally.

// Time: O(n * p * k), Space: O(n * k)
func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {
    var tab = Array(repeating: Array(repeating: 0, count: k + 1), count: piles.count + 1)

    for i in 1..<tab.count {
        for j in 1..<tab[0].count {
            tab[i][j] = tab[i - 1][j]
            var sum = 0

            for p in 0..<min(piles[i - 1].count, j) {
                sum += piles[i - 1][p]
                tab[i][j] = max(tab[i][j], tab[i - 1][j - p - 1] + sum)
            }
        }
    }

    return tab[piles.count][k]
}

print(maxValueOfCoins([[1,100,3],[7,8,9]], 2))
print(maxValueOfCoins([[100],[100],[100],[100],[100],[100],[1,1,1,1,1,1,700]], 7))


func maxValueOfCoins2(_ piles: [[Int]], _ k: Int) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ k: Int) -> Int {
        let key = "\(i),\(k)"

        if k == 0 || i == piles.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, k)
        var sum = 0

        for j in 0..<min(piles[i].count, k) {
            sum += piles[i][j]
            result = max(result, dp(i + 1, k - j - 1) + sum)
        }

        memo[key] = result
        return result
    }

    return dp(0, k)
}