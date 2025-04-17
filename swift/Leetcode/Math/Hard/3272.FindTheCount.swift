class Solution {
    private func factorial(_ num: Int) -> Int {
        guard num >= 0 else { return 0 }
        if num == 0 { return 1 }
        var result = 1
        guard num <= 20 else { return Int.max } // Prevent overflow for standard 64-bit Int
        for i in 1...num {
             let (partialValue, overflow) = result.multipliedReportingOverflow(by: i)
             guard !overflow else { return Int.max }
             result = partialValue
        }
        return result
    }

    private func power(_ base: Int, _ exp: Int) -> Int {
         guard exp >= 0 else { return 0 }
         if exp == 0 { return 1 }
         var result = 1
         for _ in 0..<exp {
              let (partialValue, overflow) = result.multipliedReportingOverflow(by: base)
              guard !overflow else { return Int.max }
              result = partialValue
         }
         return result
    }

    func countGoodIntegers(_ n: Int, _ k: Int) -> Int {
        var dictionary = Set<String>()
        guard n > 0 else { return 0 }
        guard k > 0 else { return 0 } // Modulo by zero is undefined

        let halfLen = (n - 1) / 2
        let base = power(10, halfLen)
        guard base != Int.max else { return 0 }

        let skip = n & 1

        // Calculate endBase carefully to avoid overflow if base is large
        let (endBase, overflowEndBase) = base.multipliedReportingOverflow(by: 10)
        guard !overflowEndBase else {
             // Handle case where base * 10 overflows
              return 0 // Or other appropriate action
        }


        for i in base..<endBase {
             var s = String(i)
             let reversedPart = String(s.reversed())
             let suffix = String(reversedPart.dropFirst(skip))
             s += suffix

             guard let palindromicInteger = Int(s) else {
                 continue
             }

             if palindromicInteger % k == 0 {
                  let sorted_s = String(s.sorted())
                  dictionary.insert(sorted_s)
             }
        }

        let fac = (0...n).map { factorial($0) }
        if fac.contains(Int.max) && n > 0 {
             // Factorial overflow occurred for n or less, results might be capped/incorrect
             // Depending on constraints, might need BigInt or return error/capped value
        }

        var ans: Int = 0

        for s in dictionary {
             var cnt = Array(repeating: 0, count: 10)
             for char in s {
                 if let digit = char.wholeNumberValue {
                     cnt[digit] += 1
                 }
             }

             guard n > 0 else { continue }
             
             let factNMinus1 = fac[n - 1]
             guard factNMinus1 != Int.max else { continue }

             let nMinusCnt0 = n - cnt[0]
             guard nMinusCnt0 >= 0 else { continue } // Should always be true if cnt[0] <= n

             var (numerator, overflowNum) = nMinusCnt0.multipliedReportingOverflow(by: factNMinus1)
             guard !overflowNum else { continue }

             var currentTot = numerator
             var calculationValid = true

             for digitCount in cnt {
                 let factor = fac[digitCount]
                 guard factor != Int.max else { calculationValid = false; break }
                 guard factor > 0 else { calculationValid = false; break }

                 let (quotient, remainder) = currentTot.quotientAndRemainder(dividingBy: factor)
                 currentTot = quotient
             }

             if calculationValid {
                 let (newAns, overflowAns) = ans.addingReportingOverflow(currentTot)
                 if !overflowAns {
                     ans = newAns
                 } else {
                     return Int.max // Indicate final answer overflowed
                 }
             }
        }

        return ans
    }
}