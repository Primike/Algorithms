// Write an algorithm to determine if a number n is happy.

func isHappy(_ n: Int) -> Bool {
    var visited = Set<Int>()
    var n = n

    while n != 1 {
        if visited.contains(n) { return false }
        
        visited.insert(n)
        var sum = 0

        while n > 0 {
            let digit = n % 10
            sum += digit * digit
            n /= 10
        }
        
        n = sum
    }

    return true
}

print(isHappy(19))
print(isHappy(2))