

func canDistribute(_ x: Int, _ quantities: [Int], _ n: Int) -> Bool {
    var j = 0
    var remaining = quantities[j]

    for _ in 0..<n {
        if remaining <= x {
            j += 1
            if j == quantities.count {
                return true
            } else {
                remaining = quantities[j]
            }
        } else {
            remaining -= x
        }
    }

    return false
}

func minimizedMaximum(_ n: Int, _ quantities: [Int]) -> Int {
    var left = 0
    var right = quantities.max() ?? 0

    while left < right {
        let middle = (left + right) / 2
        if canDistribute(middle, quantities, n) {
            right = middle
        } else {
            left = middle + 1
        }
    }

    return left
}