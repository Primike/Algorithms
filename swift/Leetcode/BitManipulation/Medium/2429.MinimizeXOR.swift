func minimizeXor(_ num1: Int, _ num2: Int) -> Int {
    var result = num1
    let targetSetBitsCount = num2.nonzeroBitCount
    var setBitsCount = result.nonzeroBitCount
    var currentBit = 0

    while setBitsCount < targetSetBitsCount {
        if !isSet(result, currentBit) {
            result = setBit(result, currentBit)
            setBitsCount += 1
        }
        currentBit += 1
    }

    currentBit = 0
    while setBitsCount > targetSetBitsCount {
        if isSet(result, currentBit) {
            result = unsetBit(result, currentBit)
            setBitsCount -= 1
        }
        currentBit += 1
    }

    return result
}

private func isSet(_ x: Int, _ bit: Int) -> Bool {
    return (x & (1 << bit)) != 0
}

private func setBit(_ x: Int, _ bit: Int) -> Int {
    return x | (1 << bit)
}

private func unsetBit(_ x: Int, _ bit: Int) -> Int {
    return x & ~(1 << bit)
}