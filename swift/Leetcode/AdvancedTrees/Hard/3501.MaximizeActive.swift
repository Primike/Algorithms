class Solution {
    func maxActiveSectionsAfterTrade(_ s: String, _ queries: [[Int]]) -> [Int] {
        let sChars = Array(s)
        let n = sChars.count
        let m = queries.count
        
        var cnt1 = 0
        for ch in sChars {
            if ch == "1" { cnt1 += 1 }
        }
        
        var left = Array(repeating: -1, count: n)
        var right = Array(repeating: -1, count: n)
        
        for i in 0..<n {
            left[i] = (i > 0 && sChars[i - 1] == sChars[i]) ? left[i - 1] + 1 : 1
        }
        for i in stride(from: n - 1, through: 0, by: -1) {
            right[i] = (i < n - 1 && sChars[i + 1] == sChars[i]) ? right[i + 1] + 1 : 1
        }
        
        var ans = Array(repeating: -1, count: m)
        let blockSize = Int(Double(n).squareRoot())
        
        struct LongQuery {
            let bid: Int
            let l: Int
            let r: Int
            let qid: Int
        }
        
        var longQueries = [LongQuery]()
        
        func bruteForce(_ l: Int, _ r: Int) -> Int {
            var i = l
            var best = 0
            var prev = -1
            
            while i <= r {
                let start = i
                while i <= r && sChars[i] == sChars[start] {
                    i += 1
                }
                if sChars[start] == "0" {
                    let cur = i - start
                    if prev != -1 {
                        best = max(best, prev + cur)
                    }
                    prev = cur
                }
            }
            return best
        }
        
        for (i, query) in queries.enumerated() {
            let l = query[0]
            let r = query[1]
            
            if r - l + 1 > blockSize {
                longQueries.append(LongQuery(bid: l / blockSize, l: l, r: r, qid: i))
            } else {
                ans[i] = cnt1 + bruteForce(l, r)
            }
        }
        
        longQueries.sort { q1, q2 in
            if q1.bid != q2.bid {
                return q1.bid < q2.bid
            }
            return q1.r < q2.r
        }
        
        var subZeroBlocks = [Int]()
        var L = 0
        var R = 0
        var bestGain = 0
        
        for (i, q) in longQueries.enumerated() {
            let bid = q.bid
            let l = q.l
            let r = q.r
            let qid = q.qid
            
            if i == 0 || bid > longQueries[i - 1].bid {
                L = (bid + 1) * blockSize - 1
                R = (bid + 1) * blockSize
                subZeroBlocks.removeAll(keepingCapacity: true)
                bestGain = 0
            }
            
            while R <= r {
                let sz = min(r - R + 1, right[R])
                if sChars[R] == "0" {
                    if !subZeroBlocks.isEmpty && sChars[R - 1] == "0" {
                        subZeroBlocks[subZeroBlocks.count - 1] += sz
                    } else {
                        subZeroBlocks.append(sz)
                    }
                    if subZeroBlocks.count >= 2 {
                        bestGain = max(bestGain, subZeroBlocks[subZeroBlocks.count - 1] + subZeroBlocks[subZeroBlocks.count - 2])
                    }
                }
                R += sz
            }
            
            var curL = L
            var leftBlocks = [Int]()
            
            while curL >= l {
                let sz = min(curL - l + 1, left[curL])
                if sChars[curL] == "0" {
                    if !leftBlocks.isEmpty && sChars[curL + 1] == "0" {
                        leftBlocks[leftBlocks.count - 1] += sz
                    } else {
                        leftBlocks.append(sz)
                    }
                }
                curL -= sz
            }
            
            var queryBestGain = bestGain
            
            if leftBlocks.isEmpty {
                ans[qid] = queryBestGain + cnt1
                continue
            }
            
            leftBlocks.reverse()
            
            var combined = leftBlocks
            if !subZeroBlocks.isEmpty {
                if sChars[L] == "0" && sChars[L + 1] == "0" {
                    combined[combined.count - 1] += subZeroBlocks[0]
                    for j in 1..<subZeroBlocks.count {
                        combined.append(subZeroBlocks[j])
                    }
                } else {
                    combined.append(contentsOf: subZeroBlocks)
                }
            }
            
            if combined.count >= 2 {
                for j in 0..<(combined.count - 1) {
                    queryBestGain = max(queryBestGain, combined[j] + combined[j + 1])
                }
            }
            
            ans[qid] = queryBestGain + cnt1
        }
        
        return ans
    }
}