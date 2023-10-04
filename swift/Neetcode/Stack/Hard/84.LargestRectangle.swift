// Given an array of integers heights representing the histogram's bar height where 
// the width of each bar is 1, return the area of the largest rectangle in the histogram.

func largestRectangleArea(_ heights: [Int]) -> Int {
    var monotomic = [(Int, Int)]()
    var result = 0

    for (i, height) in heights.enumerated() {
        var start = i

        while let last = monotomic.last, height < last.1 {
            var (index, height) = monotomic.removeLast()
            result = max(result, height * (i - index))
            start = index
        }

        monotomic.append((start, height))
    }

    for (index, height) in monotomic {
        result = max(result, height * (heights.count - index))
    }

    return result
}

print(largestRectangleArea([2,1,5,6,2,3]))
print(largestRectangleArea([2,4]))