// Initially, you start with a score of 1. You have to maximize your score 
// by applying the following operation at most k times:
// Choose any non-empty subarray nums[l, ..., r] that you haven't chosen previously.
// Choose an element x of nums[l, ..., r] with the highest prime score. 
// If multiple such elements exist, choose the one with the smallest index.
// Multiply your score by x.
// Return the maximum possible score after applying at most k operations.

func maximumScore(_ nums: [Int], _ k: Int) -> Int {
    var primeScores = Array(repeating: 0, count: nums.count)

    for (i, number) in nums.enumerated() {
        if number < 2 { continue }

        var factors = Set<Int>()
        var current = number

        if current % 2 == 0 { factors.insert(2) }

        while current % 2 == 0 {
            current /= 2
        }

        var odd = 3

        while odd * odd <= current {
            if current % odd == 0 { factors.insert(odd) }

            while current % odd == 0 {
                current /= odd
            }

            odd += 2
        }

        if current > 1 { factors.insert(current) }
        primeScores[i] = factors.count
    }

    var nextDominant = Array(repeating: nums.count, count: nums.count)
    var prevDominant = Array(repeating: -1, count: nums.count)
    var monotomic = [(Int, Int)]()

    for i in 0..<nums.count {
        while let last = monotomic.last, last.1 < primeScores[i] {
            nextDominant[last.0] = i
            monotomic.removeLast()
        }

        if let last = monotomic.last { prevDominant[i] = last.0 }
        monotomic.append((i, primeScores[i]))
    }

    var subarrays = Array(repeating: 0, count: nums.count)

    for i in 0..<nums.count {
        subarrays[i] = (nextDominant[i] - i) * (i - prevDominant[i])
    }

    let mod = 1_000_000_007
    let nums = nums.enumerated().sorted { $0.element > $1.element }
    var result = 1
    var k = k
    var i = 0

    while k > 0 {
        let (index, num) = nums[i]
        let operations = min(k, subarrays[index])
        var current = 1
        var base = num % mod
        var power = operations

        while power > 0 {
            if power % 2 == 1 { current = (current * base) % mod }
            base = (base * base) % mod
            power /= 2
        }

        result = (result * current) % mod
        k -= operations
        i += 1
    }

    return result
}

print(maximumScore([8,3,9,3,8], 2))
print(maximumScore([19,12,14,6,10,18], 3))