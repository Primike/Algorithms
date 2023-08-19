// You have n coins and you want to build a staircase with these coins. 
// The last row of the staircase may be incomplete.
// Given the integer n, return the number of complete rows 
// of the staircase you will build.

func arrangeCoins(_ n: Int) -> Int {
    var left = 0, right = n 

    while left <= right {
        let mid = (right + left) / 2
        let requiredCoins = ((mid * mid - mid) / 2) + mid

        if requiredCoins > n {
            right = mid - 1
        } else if requiredCoins < n {
            left = mid + 1
        } else {
            return mid
        }
    }

    return right
}

print(arrangeCoins(5))
print(arrangeCoins(8))