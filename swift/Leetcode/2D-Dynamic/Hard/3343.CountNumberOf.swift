class Solution {
    private let MOD: Int = 1_000_000_000 + 7
    private var memo: [State: Int] = [:]
    
    private var psum: [Int] = []
    private var cnt: [Int: Int] = [:] 
    private var target: Int = 0
    private var nDigitsGlobal: Int = 0 

    private var fact: [Int] = []
    private var invFact: [Int] = []

    private struct State: Hashable {
        let pos: Int    
        let currSum: Int 
        let oddCntRem: Int 
    }

    private func power(_ base: Int, _ exp: Int) -> Int {
        var res = 1
        var b = base % MOD
        var e = exp
        while e > 0 {
            if e % 2 == 1 { res = Int((Int64(res) * Int64(b)) % Int64(MOD)) }
            b = Int((Int64(b) * Int64(b)) % Int64(MOD))
            e /= 2
        }
        return res
    }

    private func inv(_ n: Int) -> Int {
        return power(n, MOD - 2)
    }

    private func precomputeFactorials(maxVal: Int) {
        if maxVal < 0 { 
            fact = [1] 
            invFact = [1]
            return
        }

        fact = Array(repeating: 1, count: maxVal + 1)
        invFact = Array(repeating: 1, count: maxVal + 1)

        if maxVal == 0 { return } 

        for i in 1...maxVal {
            fact[i] = Int((Int64(fact[i - 1]) * Int64(i)) % Int64(MOD))
        }
        
        invFact[maxVal] = inv(fact[maxVal])
        if maxVal > 0 { 
            for i in stride(from: maxVal - 1, through: 1, by: -1) {
                invFact[i] = Int((Int64(invFact[i + 1]) * Int64(i + 1)) % Int64(MOD))
            }
        }
    }

    private func combinations(_ n: Int, _ k: Int) -> Int {
        if k < 0 || k > n {
            return 0
        }
        if k == 0 || k == n { 
            return 1
        }
        
        if n >= fact.count {
            return 0 
        }
        
        let num = fact[n]
        let denPart1 = invFact[k]
        let denPart2 = invFact[n - k]
        let den = (Int64(denPart1) * Int64(denPart2)) % Int64(MOD)
        
        return Int((Int64(num) * den) % Int64(MOD))
    }

    private func dfs(_ pos: Int, _ currentSumOdd: Int, _ oddPositionsToFill: Int) -> Int {
        if oddPositionsToFill < 0 || psum[pos] < oddPositionsToFill || currentSumOdd > target {
            return 0
        }

        if pos > 9 { 
            return (currentSumOdd == target && oddPositionsToFill == 0) ? 1 : 0
        }

        let state = State(pos: pos, currSum: currentSumOdd, oddCntRem: oddPositionsToFill)
        if let cachedResult = memo[state] {
            return cachedResult
        }
        
        let evenPositionsToFill = psum[pos] - oddPositionsToFill
        
        var localResult = 0
        let countOfCurrentDigit = cnt[pos] ?? 0 
        
        let lowerBoundForI = max(0, countOfCurrentDigit - evenPositionsToFill)
        let upperBoundForI = min(countOfCurrentDigit, oddPositionsToFill)

        if lowerBoundForI <= upperBoundForI {
            for i in lowerBoundForI...upperBoundForI {
                let numCurrentDigitInOdd = i
                let numCurrentDigitInEven = countOfCurrentDigit - numCurrentDigitInOdd
                
                let waysOdd = combinations(oddPositionsToFill, numCurrentDigitInOdd)
                let waysEven = combinations(evenPositionsToFill, numCurrentDigitInEven)
                
                let combinationsProduct = (Int64(waysOdd) * Int64(waysEven)) % Int64(MOD)
                
                let nextDfsResult = dfs(pos + 1, 
                                        currentSumOdd + numCurrentDigitInOdd * pos, 
                                        oddPositionsToFill - numCurrentDigitInOdd)
                
                let term = (combinationsProduct * Int64(nextDfsResult)) % Int64(MOD)
                localResult = (localResult + Int(term)) % MOD
            }
        }
        
        memo[state] = localResult
        return localResult
    }

    func countBalancedPermutations(_ numStr: String) -> Int {
        let digits = numStr.compactMap { $0.wholeNumberValue }
        nDigitsGlobal = digits.count

        if nDigitsGlobal == 0 { 
            return 0 
        }

        memo = [:]
        cnt = [:]
        
        precomputeFactorials(maxVal: nDigitsGlobal)

        let totalSum = digits.reduce(0, +)
        if totalSum % 2 != 0 {
            return 0 
        }
        target = totalSum / 2 

        for digit in digits {
            cnt[digit, default: 0] += 1
        }

        let numOddPositionsOverall = (nDigitsGlobal + 1) / 2 
        
        psum = Array(repeating: 0, count: 11) 
        for i in stride(from: 9, through: 0, by: -1) {
            psum[i] = psum[i + 1] + (cnt[i] ?? 0)
        }
        
        return dfs(0, 0, numOddPositionsOverall)
    }
}