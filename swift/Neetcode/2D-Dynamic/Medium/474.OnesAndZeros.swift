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
    var strings = [(Int, Int)]()

    for string in strs {
        let zeros = string.filter { $0 == "0" }, ones = string.filter { $0 == "1" }
        strings.append((zeros.count, ones.count))
    }

    var memo = [[Int]: Int]()

    func dp(_ i: Int, _ zeros: Int, _ ones: Int) -> Int {
        let key = [i, zeros, ones]

        if i == strings.count { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, zeros, ones)
        let (z, o) = strings[i]

        if zeros + z <= m, ones + o <= n { 
            result = max(result, dp(i + 1, zeros + z, ones + o) + 1)
        }

        memo[key] = result
        return result
    }

    return dp(0, 0, 0)
}