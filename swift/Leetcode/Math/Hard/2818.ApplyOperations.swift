class Solution {
    let MOD = 1000000007
    func maximumScore(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var primeScores = [Int](repeating: 0, count: n)
        let maxElement = nums.max()!
        let primes = getPrimes(maxElement)
        for i in 0..<n {
            var num = nums[i]
            for prime in primes {
                if prime * prime > num { break }
                if num % prime != 0 { continue }
                primeScores[i] += 1
                while num % prime == 0 { num /= prime }
            }
            if num > 1 { primeScores[i] += 1 }
        }

        var nextDominant = [Int](repeating: n, count: n)
        var prevDominant = [Int](repeating: -1, count: n)
        var stack = [Int]()
        for i in 0..<n {
            while !stack.isEmpty && primeScores[stack.last!] < primeScores[i] {
                let top = stack.removeLast()
                nextDominant[top] = i
            }
            if !stack.isEmpty {
                prevDominant[i] = stack.last!
            }
            stack.append(i)
        }

        var numOfSubarrays = [Int](repeating: 0, count: n)
        for i in 0..<n {
            numOfSubarrays[i] = (nextDominant[i] - i) * (i - prevDominant[i])
        }

        let sortedArray = nums.enumerated().sorted { $0.element > $1.element }
        var score = 1
        var remainingK = k
        var processingIndex = 0

        func power(_ base: Int, _ exponent: Int) -> Int {
            var res = 1
            var b = base % MOD
            var e = exponent
            while e > 0 {
                if e % 2 == 1 { res = (res * b) % MOD }
                b = (b * b) % MOD
                e /= 2
            }
            return res
        }

        while remainingK > 0 {
            let (index, num) = sortedArray[processingIndex]
            processingIndex += 1
            let operations = min(remainingK, numOfSubarrays[index])
            score = (score * power(num, operations)) % MOD
            remainingK -= operations
        }

        return score
    }

    func getPrimes(_ limit: Int) -> [Int] {
        if limit < 2 { return [] }
        var isPrime = [Bool](repeating: true, count: limit + 1)
        var primes = [Int]()
        for number in 2...limit {
            if !isPrime[number] { continue }
            primes.append(number)
            var multiple = number * number
            while multiple <= limit {
                isPrime[multiple] = false
                multiple += number
            }
        }
        return primes
    }
}