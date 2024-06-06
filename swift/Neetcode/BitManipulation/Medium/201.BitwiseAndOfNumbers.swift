// Given two integers left and right that represent the range [left, right], 
// return the bitwise AND of all numbers in this range, inclusive.

func rangeBitwiseAnd(_ left: Int, _ right: Int) -> Int {
    var left = left, right = right
    var shifts = 0

    while left != right {
        left >>= 1
        right >>= 1
        shifts += 1
    }

    return left << shifts
}

print(rangeBitwiseAnd(5, 7))
print(rangeBitwiseAnd(0, 0))
print(rangeBitwiseAnd(1, 2147483647))