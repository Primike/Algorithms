// Given a positive integer num, return true if num is a perfect square 
// or false otherwise.

func isPerfectSquare(_ num: Int) -> Bool {
    var left = 1, right = num

    while left <= right {
        let mid = (right + left) / 2

        if mid * mid > num {
            right = mid - 1
        } else if mid * mid < num {
            left = mid + 1
        } else {
            return true
        }
    }

    return false
}

print(isPerfectSquare(16))
print(isPerfectSquare(14))