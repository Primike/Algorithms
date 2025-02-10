struct CharCount: Comparable {
    let char: Character
    var count: Int

    static func < (lhs: CharCount, rhs: CharCount) -> Bool {
        return lhs.char < rhs.char 
    }
}

func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
    var charCountDict: [Character: Int] = [:]
    for char in s {
        charCountDict[char, default: 0] += 1
    }

    var maxHeap = Heap<CharCount>(.maxHeap, charCountDict.map { CharCount(char: $0.key, count: $0.value) })
    var result = ""

    while !maxHeap.isEmpty {
        guard let current = maxHeap.pop() else { break }
        let use = min(current.count, repeatLimit)
        result.append(String(repeating: current.char, count: use))

        if current.count > use {
            if let next = maxHeap.pop() {
                result.append(next.char)
                if next.count > 1 {
                    maxHeap.push(CharCount(char: next.char, count: next.count - 1))
                }
                maxHeap.push(CharCount(char: current.char, count: current.count - use))
            }
        }
    }

    return result
}