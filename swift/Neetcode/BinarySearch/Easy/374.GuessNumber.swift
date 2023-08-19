// I pick a number from 1 to n. You have to guess which number I picked.
// Every time you guess wrong, I will tell you whether the number 
// I picked is higher or lower than your guess.

var pick = None

func guess(_ n: Int) -> Int {
    if n == pick {
        return 0
    } else if n > pick {
        return -1
    } else {
        return 1
    }
}

func guessNumber(_ n: Int) -> Int {
    var left = 1, right = n

    while left <= right {
        let mid = (right + left) / 2
        let result = guess(mid)

        if result == -1 {
            right = mid - 1
        } else if result == 1 {
            left = mid + 1
        } else {
            return mid
        }
    }

    return left
}

pick = 6
print(guessNumber(10))
pick = 1
print(guessNumber(1))
pick = 2
print(guessNumber(2))