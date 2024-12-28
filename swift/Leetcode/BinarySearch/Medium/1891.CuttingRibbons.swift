func maxLength(_ ribbons: [Int], _ k: Int) -> Int {
    var left = 0
    var right = ribbons.max() ?? 0

    while left < right {
        let middle = (left + right + 1) / 2
        var totalRibbons = 0
        for ribbon in ribbons {
            totalRibbons += ribbon / middle
            if totalRibbons >= k { break }
        }
        if totalRibbons >= k {
            left = middle
        } else {
            right = middle - 1
        }
    }

    return left
}

print(maxLength([9,7,5], 3))
print(maxLength([7,5,9], 4))
print(maxLength([5,7,9], 22))