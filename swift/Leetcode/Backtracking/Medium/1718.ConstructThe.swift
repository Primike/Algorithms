func constructDistancedSequence(_ targetNumber: Int) -> [Int] {
    var resultSequence = [Int](repeating: 0, count: targetNumber * 2 - 1)
    var isNumberUsed = [Bool](repeating: false, count: targetNumber + 1)
    _ = findLexicographicallyLargestSequence(0, &resultSequence, &isNumberUsed, targetNumber)
    return resultSequence
}

func findLexicographicallyLargestSequence(_ currentIndex: Int, _ resultSequence: inout [Int], _ isNumberUsed: inout [Bool], _ targetNumber: Int) -> Bool {
    if currentIndex == resultSequence.count { return true }
    if resultSequence[currentIndex] != 0 {
        return findLexicographicallyLargestSequence(currentIndex + 1, &resultSequence, &isNumberUsed, targetNumber)
    }
    for numberToPlace in stride(from: targetNumber, through: 1, by: -1) {
        if isNumberUsed[numberToPlace] { continue }
        isNumberUsed[numberToPlace] = true
        resultSequence[currentIndex] = numberToPlace
        if numberToPlace == 1 {
            if findLexicographicallyLargestSequence(currentIndex + 1, &resultSequence, &isNumberUsed, targetNumber) { return true }
        } else if currentIndex + numberToPlace < resultSequence.count && resultSequence[currentIndex + numberToPlace] == 0 {
            resultSequence[currentIndex + numberToPlace] = numberToPlace
            if findLexicographicallyLargestSequence(currentIndex + 1, &resultSequence, &isNumberUsed, targetNumber) { return true }
            resultSequence[currentIndex + numberToPlace] = 0
        }
        resultSequence[currentIndex] = 0
        isNumberUsed[numberToPlace] = false
    }
    return false
}