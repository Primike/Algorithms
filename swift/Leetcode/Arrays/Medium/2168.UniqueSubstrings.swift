func equalDigitFrequency(_ s: String) -> Int {
    let n = s.count
    let prime = 31
    let mod = 1_000_000_000
    var validSubstringHashes = Set<Int>()

    let characters = Array(s)
    
    for start in 0..<n {
        var digitFrequency = [Int](repeating: 0, count: 10)
        var uniqueDigitsCount = 0
        var substringHash = 0
        var maxDigitFrequency = 0

        for end in start..<n {
            let currentDigit = Int(String(characters[end]))!

            if digitFrequency[currentDigit] == 0 {
                uniqueDigitsCount += 1
            }

            digitFrequency[currentDigit] += 1
            maxDigitFrequency = max(maxDigitFrequency, digitFrequency[currentDigit])

            substringHash = (prime * substringHash + currentDigit + 1) % mod

            if maxDigitFrequency * uniqueDigitsCount == end - start + 1 {
                validSubstringHashes.insert(substringHash)
            }
        }
    }

    return validSubstringHashes.count
}