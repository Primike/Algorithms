func maximumSwap(_ num: Int) -> Int {
    var number = Array(String(num))
    var maxRightIndex = Array(repeating: 0, count: number.count)
    maxRightIndex[number.count - 1] = number.count - 1

    for i in stride(from: number.count - 2, through: 0, by: -1) {
        maxRightIndex[i] = (number[i] > number[maxRightIndex[i + 1]]) ? i : maxRightIndex[i + 1]
    }

    for i in 0..<number.count {
        if number[i] < number[maxRightIndex[i]] {
            number.swapAt(i, maxRightIndex[i])
            return Int(String(number))!
        }
    }

    return num
}