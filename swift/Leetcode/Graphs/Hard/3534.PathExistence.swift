class Solution {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Int] {
        var enumeratedNums = [(orig: Int, val: Int)]()
        for (i, num) in nums.enumerated() {
            enumeratedNums.append((orig: i, val: num))
        }
        enumeratedNums.sort { $0.val < $1.val }
        
        var getI = Array(repeating: 0, count: n)
        for (i, pair) in enumeratedNums.enumerated() {
            getI[pair.orig] = i
        }
        
        let logSize = 18
        var st = Array(repeating: Array(repeating: 0, count: logSize), count: n)
        
        var r = 0
        for i in 0..<n {
            if r < i { r = i }
            while r + 1 < n &&
                  enumeratedNums[r + 1].val - enumeratedNums[r].val <= maxDiff &&
                  enumeratedNums[r + 1].val - enumeratedNums[i].val <= maxDiff {
                r += 1
            }
            st[i][0] = r
        }
        
        for j in 1..<logSize {
            for i in 0..<n {
                st[i][j] = st[st[i][j - 1]][j - 1]
            }
        }
        
        var ans = [Int]()
        ans.reserveCapacity(queries.count)
        
        for query in queries {
            var a = getI[query[0]]
            var b = getI[query[1]]
            if a > b {
                let temp = a
                a = b
                b = temp
            }
            if a == b {
                ans.append(0)
                continue
            }
            
            var curr = a
            var steps = 0
            for j in stride(from: logSize - 1, through: 0, by: -1) {
                if st[curr][j] < b {
                    curr = st[curr][j]
                    steps += (1 << j)
                }
            }
            
            ans.append(st[curr][0] >= b ? steps + 1 : -1)
        }
        
        return ans
    }
}