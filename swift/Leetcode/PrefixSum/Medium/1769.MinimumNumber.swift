// You have n boxes. You are given a binary string boxes of length n, 
// where boxes[i] is '0' if the ith box is empty, and '1' if it contains one ball.
// In one operation, you can move one ball from a box to an adjacent box. 
// Box i is adjacent to box j if abs(i - j) == 1. Note that after doing so, 
// there may be more than one ball in some boxes.
// Return an array answer of size n, where answer[i] is the minimum 
// number of operations needed to move all the balls to the ith box.

// Time: O(n), Space: O(1)
func minOperations(_ boxes: String) -> [Int] {
    let boxes = Array(boxes)
    var result = Array(repeating: 0, count: boxes.count)
    var ballsLeft = 0
    var currentLeft = 0
    var ballsRight = 0
    var currentRight = 0

    for i in 0..<boxes.count {
        result[i] += currentLeft
        ballsLeft += boxes[i] == "1" ? 1 : 0
        currentLeft += ballsLeft

        let j = boxes.count - 1 - i
        result[j] += currentRight
        ballsRight += boxes[j] == "1" ? 1 : 0
        currentRight += ballsRight
    }

    return result
}

print(minOperations("110"))
print(minOperations("001011"))