func doesValidArrayExist(_ derived: [Int]) -> Bool {
    return derived.reduce(0, +) % 2 == 0
}