class Solution {
    func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
        var answer = [Bool]()
        var prefix = 0
        for num in nums {
            prefix = ((prefix << 1) + num) % 5
            answer.append(prefix == 0)
        }
        return answer
    }
}