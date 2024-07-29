// There are several cards arranged in a row, and each card has an 
// associated number of points. The points are given in the integer array cardPoints.
// In one step, you can take one card from the beginning or from the end of the row. 
// You have to take exactly k cards.
// Given the integer array cardPoints and the integer k, 
// return the maximum score you can obtain.

// Time: O(n), Space: O(1)
func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
    if cardPoints.count == k { return cardPoints.reduce(0, +) }

    let total = cardPoints.reduce(0, +)
    var result = 0
    var sum = 0
    var left = 0

    for (i, card) in cardPoints.enumerated() {
        sum += card
        if i - left + 1 < cardPoints.count - k { continue }

        result = max(result, total - sum)
        sum -= cardPoints[left]
        left += 1
    }

    return result
}

print(maxScore([1,2,3,4,5,6,1], 3))
print(maxScore([2,2,2], 2))
print(maxScore([9,7,7,9,7,7,9], 7))