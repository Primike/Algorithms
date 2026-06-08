class Solution {
    func confusingNumber(_ n: Int) -> Bool {
        let invertMap: [Int: Int] = [0: 0, 1: 1, 6: 9, 8: 8, 9: 6]
        var rotatedNumber = 0
        var nCopy = n

        while nCopy > 0 {
            let res = nCopy % 10
            guard let invertedDigit = invertMap[res] else {
                return false
            }

            rotatedNumber = rotatedNumber * 10 + invertedDigit
            nCopy /= 10
        }
        
        return rotatedNumber != n
    }
}