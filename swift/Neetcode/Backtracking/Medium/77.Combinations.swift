// Given two integers n and k, return all possible combinations of 
// k numbers chosen from the range [1, n].

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var result = [[Int]]()

    func backtrack(_ left: Int, _ current: [Int]) {
        if current.count == k {
            result.append(current)
            return
        }

        for i in left..<n + 1 {
            backtrack(i + 1, current + [i])
        }
    }

    backtrack(1, [])
    return result
}