func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
    var x: Int64 = 0, y: Int64 = 0
    var current: Int64 = 0

    for d in differences {
        current += Int64(d)
        x = min(x, current)
        y = max(y, current)
    }

    let rangeDiff = y - x
    let allowedRange = Int64(upper) - Int64(lower)

    if rangeDiff > allowedRange {
        return 0
    } else {
        let count = allowedRange - rangeDiff + 1
        return Int(count)
    }
}