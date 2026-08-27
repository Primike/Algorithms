class Solution {
    func checkDivisibility(_ n: Int) -> Bool {
        var digitSum = 0
        var digitProduct = 1
        let original = n
        var num = n

        while num > 0 {
            let digit = num % 10
            num /= 10

            digitSum += digit
            digitProduct *= digit
        }

        return original % (digitSum + digitProduct) == 0
    }
}