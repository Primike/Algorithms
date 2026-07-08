class ValidWordAbbr {
    private var abbrDict = [String: Bool]()
    private var dict: Set<String>

    init(_ dictionary: [String]) {
        self.dict = Set(dictionary)
        for s in dict {
            let abbr = toAbbr(s)
            abbrDict[abbr] = abbrDict[abbr] == nil
        }
    }

    func isUnique(_ word: String) -> Bool {
        let abbr = toAbbr(word)
        guard let hasAbbr = abbrDict[abbr] else {
            return true
        }
        return hasAbbr && dict.contains(word)
    }

    private func toAbbr(_ s: String) -> String {
        let n = s.count
        if n <= 2 {
            return s
        }
        let first = s.first!
        let last = s.last!
        return "\(first)\(n - 2)\(last)"
    }
}