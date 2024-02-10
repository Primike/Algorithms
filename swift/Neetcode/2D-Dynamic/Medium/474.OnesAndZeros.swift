// You are given an array of binary strings strs and two integers m and n.
// Return the size of the largest subset of strs such that there are 
// at most m 0's and n 1's in the subset.
// A set x is a subset of a set y if all elements of x are also elements of y.

func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var tab = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)

    for string in strs {
        let zeros = string.filter { $0 == "0" }.count
        let ones = string.count - zeros

        for i in stride(from: m, through: zeros, by: -1) {
            for j in stride(from: n, through: ones, by: -1) {
                tab[i][j] = max(tab[i][j], tab[i - zeros][j - ones] + 1)
            }
        }
    }

    return tab[m][n]
}

print(findMaxForm(["10","0001","111001","1","0"], 5, 3))
print(findMaxForm(["10","0","1"], 1, 1))


func findMaxForm2(_ strs: [String], _ m: Int, _ n: Int) -> Int {
    var binary = [(Int, Int)]()

    for string in strs {
        let zeros = string.filter { $0 == "0" }, ones = string.filter { $0 == "1" }
        binary.append((zeros.count, ones.count))
    }

    var memo = [String: Int]()

    func dp(_ i: Int, _ m: Int, _ n: Int) -> Int {
        let key = "\(i),\(m),\(n)"

        if m < 0 || n < 0 || i >= binary.count { return 0 }
        if let value = memo[key] { return value }

        let skip = dp(i + 1, m, n)
        var take = dp(i + 1, m - binary[i].0, n - binary[i].1)

        if m - binary[i].0 >= 0, n - binary[i].1 >= 0 { take += 1 }
        let result = max(take, skip)

        memo[key] = result
        return result
    }

    return dp(0, m, n)
}