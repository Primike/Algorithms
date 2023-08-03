//Two rectangles i and j (i < j) are considered interchangeable if they have the same 
//width-to-height ratio. More formally, two rectangles are interchangeable if 
//widthi/heighti == widthj/heightj (using decimal division, not integer division).
//Return the number of pairs of interchangeable rectangles in rectangles.

func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
    var ratios = [Double: Int]()

    for sides in rectangles {
        ratios[Double(sides[0]) / Double(sides[1]), default: 0] += 1
    }

    return ratios.values.reduce(0) { $0 + ($1 * ($1 - 1)) / 2 }
}

print(interchangeableRectangles([[4,8],[3,6],[10,20],[15,30]]))
print(interchangeableRectangles([[4,5],[7,8]]))