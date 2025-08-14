class Solution {
    func productQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
        let mod = 1_000_000_007

        var bins: [Int] = []
        var rep = 1
        var tempN = n
        
        while tempN > 0 {
            if tempN % 2 == 1 {
                bins.append(rep)
            }
            tempN /= 2
            if tempN > 0 {
                rep *= 2
            }
        }

        let m = bins.count
        var results = Array(repeating: Array(repeating: 0, count: m), count: m)

        for i in 0..<m {
            var currentProduct = 1
            for j in i..<m {
                currentProduct = (currentProduct * bins[j]) % mod
                results[i][j] = currentProduct
            }
        }

        return queries.map { query in
            results[query[0]][query[1]]
        }
    }
}