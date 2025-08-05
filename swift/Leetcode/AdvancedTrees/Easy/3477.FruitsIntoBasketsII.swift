class Solution {
    func numOfUnplacedFruits(_ fruits: [Int], _ baskets: [Int]) -> Int {
        var baskets = baskets
        var result = 0

        for i in 0..<fruits.count {
            var didPlace = false 

            for j in 0..<baskets.count {
                if fruits[i] <= baskets[j] {
                    baskets[j] = 0
                    didPlace = true
                    break
                }
            }

            if !didPlace { result += 1 }
        }

        return result
    }
}