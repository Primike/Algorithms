//Two rectangles i and j (i < j) are considered interchangeable if they have the same 
//width-to-height ratio. More formally, two rectangles are interchangeable if 
//widthi/heighti == widthj/heightj (using decimal division, not integer division).
//Return the number of pairs of interchangeable rectangles in rectangles.

func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
    var result = 0
    var dict = rectangles.reduce(into: [Double: Int]()) { currentDict, rectangle in
        let ratio = Double(rectangle[1]) / Double(rectangle[0])
        currentDict[ratio, default: 0] += 1
    }

    for value in dict.values {
        if value > 1 {
            result += (value * (value - 1)) / 2
        }
    }

    return result
}

print(interchangeableRectangles([[4,8],[3,6],[10,20],[15,30]]))
print(interchangeableRectangles([[4,5],[7,8]]))