// There are n oranges in the kitchen and you decided to eat 
// some of these oranges every day as follows:
// Eat one orange.
// If the number of remaining oranges n is divisible by 2 then you can eat n / 2 oranges.
// If the number of remaining oranges n is divisible by 3 then you can eat 2 * (n / 3) oranges.
// You can only choose one of the actions per day.
// Given the integer n, return the minimum number of days to eat n oranges.

func minDays(_ n: Int) -> Int {
    var queue = Set([n])
    var result = 0

    while !queue.isEmpty {
        var nextQueue = Set<Int>()

        for number in queue {
            if number == 0 { return result }

            nextQueue.insert(number - 1)
            if number % 2 == 0 { nextQueue.insert(number / 2) }
            if number % 3 == 0 { nextQueue.insert(number / 3) }
        }

        result += 1
        queue = nextQueue
    }

    return result
}

print(minDays(10))
print(minDays(6))


// TLE
func minDays2(_ n: Int) -> Int {
    var tab = Array(repeating: Int.max, count: n + 1)
    tab[n] = 0

    for i in stride(from: n, to: 0, by: -1) {
        if tab[i] == Int.max { continue }

        tab[i - 1] = min(tab[i - 1], tab[i] + 1)
        if i % 2 == 0 { tab[i / 2] = min(tab[i / 2], tab[i] + 1) }
        if i % 3 == 0 { tab[i / 3] = min(tab[i / 3], tab[i] + 1) }
    }

    return tab[0]
}

func minDays3(_ n: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if let value = memo[n] { return value }
        
        var result = dp(n - 1)
        if n % 2 == 0 { result = min(result, dp(n / 2)) }
        if n % 3 == 0 { result = min(result, dp(n / 3)) }
        
        result += 1
        memo[n] = result
        return result
    }

    return dp(n)
}