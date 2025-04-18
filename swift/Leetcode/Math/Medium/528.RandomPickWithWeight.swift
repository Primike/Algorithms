// You are given a 0-indexed array of positive integers w 
// where w[i] describes the weight of the ith index.
// You need to implement the function pickIndex(), 
// which randomly picks an index in the range [0, w.length - 1] 
// (inclusive) and returns it. 
// The probability of picking an index i is w[i] / sum(w).

// Time: O(n, log(n)), Space: O(n)
class Solution {

    private var probabilities: [Int]
    private let total: Int

    init(_ w: [Int]) {
        var array = [Int]()
        var total = 0

        for number in w {
            total += number
            array.append(total)
        }

        self.probabilities = array
        self.total = total
    }
    
    func pickIndex() -> Int {
        let random = Int.random(in: 1...total)
        var left = 0, right = probabilities.count - 1

        while left < right {
            let mid = (right + left) / 2

            if probabilities[mid] >= random {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return right
    }
}