// In a row of dominoes, tops[i] and bottoms[i] 
// represent the top and bottom halves of the ith domino. 
// (A domino is a tile with two numbers from 1 to 6 - one on each half of the tile.)
// We may rotate the ith domino, so that tops[i] and bottoms[i] swap values.
// Return the minimum number of rotations so that all the values in tops are the same,
// or all the values in bottoms are the same.
// If it cannot be done, return -1.

// Time: O(n), Space: O(1)
func minDominoRotations(_ tops: [Int], _ bottoms: [Int]) -> Int {
    var num1 = tops[0], count1 = 0
    var num2 = bottoms[0], count2 = 0

    for i in 0..<tops.count {
        if tops[i] == num1 || bottoms[i] == num1 { count1 += 1 }
        if tops[i] == num2 || bottoms[i] == num2 { count2 += 1 }
    }

    if count1 < tops.count, count2 < tops.count { return -1 }

    var largest = count1 > count2 ? num1 : num2
    var topCount = 0
    var bottomCount = 0

    for i in 0..<tops.count {
        if tops[i] != largest { topCount += 1 }
        if bottoms[i] != largest { bottomCount += 1 }
    }

    return min(topCount, bottomCount)
}

print(minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2]))
print(minDominoRotations([3,5,1,2,3], [3,6,3,3,4]))