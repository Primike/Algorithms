// There are several cards arranged in a row, and each card has an 
// associated number of points. The points are given in the integer array cardPoints.
// In one step, you can take one card from the beginning or from the end of the row. 
// You have to take exactly k cards.
// Given the integer array cardPoints and the integer k, 
// return the maximum score you can obtain.

// Time: O(n), Space: O(k)
func maxScore(_ cardPoints: [Int], _ k: Int) -> Int {
    var window = Array(cardPoints[..<k]).reduce(0, +)
    var left = k - 1, right = cardPoints.count - 1
    var result = window

    for i in 0..<k {
        window += cardPoints[right] - cardPoints[left]
        result = max(result, window)

        left -= 1
        right -= 1
    }

    return result
}

print(maxScore([1,2,3,4,5,6,1], 3))
print(maxScore([2,2,2], 2))
print(maxScore([9,7,7,9,7,7,9], 7))