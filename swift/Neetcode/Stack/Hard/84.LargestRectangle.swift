// Given an array of integers heights representing the histogram's bar height where 
// the width of each bar is 1, return the area of the largest rectangle in the histogram.

// Time: O(n), Space: O(n)
func largestRectangleArea(_ heights: [Int]) -> Int {
    var stack = [(Int, Int)]()
    var result = 0

    for (i, height) in heights.enumerated() {
        var index = i

        while let last = stack.last, last.1 > height {
            stack.removeLast()
            result = max(result, last.1 * (i - last.0))
            index = last.0
        }

        stack.append((index, height))
    }

    for (i, height) in stack {
        result = max(result, height * (heights.count - i))
    }

    return result
}

print(largestRectangleArea([2,1,5,6,2,3]))
print(largestRectangleArea([2,4]))