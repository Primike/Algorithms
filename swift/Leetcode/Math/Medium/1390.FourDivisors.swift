class Solution {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        var divSum = 0

        for i in nums {
            var divCount = 0
            var inSum = 0
            let limit = Int(Double(i).squareRoot())

            if limit > 0 {
                for divisor in 1...limit {
                    if i % divisor == 0 {
                        let other = i / divisor

                        if divisor == other {
                            divCount += 1
                            inSum += divisor
                        } else {
                            divCount += 2
                            inSum += divisor + other
                        }

                        if divCount > 4 {
                            break
                        }
                    }
                }
            }

            if divCount == 4 {
                divSum += inSum
            }
        }

        return divSum
    }
}