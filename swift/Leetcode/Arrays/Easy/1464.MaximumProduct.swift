class Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        var biggest = 0
        var secondBiggest = 0
        for num in nums {
            if num > biggest {
                secondBiggest = biggest
                biggest = num
            } else {
                secondBiggest = max(secondBiggest, num)
            }
        }
        return (biggest - 1) * (secondBiggest - 1)
    }
}