// Given a non-negative integer x, return the square root of x rounded down 
// to the nearest integer. The returned integer should be non-negative as well.

func mySqrt(_ x: Int) -> Int {
    var left = 1, right = x 

    while left <= right {
        let mid = (right + left) / 2

        if mid * mid > x {
            right = mid - 1
        } else if mid * mid < x {
            left = mid + 1
        } else {
            return mid
        }
    }

    return right
}

print(mySqrt(4))
print(mySqrt(8))