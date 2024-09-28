func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
    var arr1Prefixes = Set<Int>()

    for var value in arr1 {
        while !arr1Prefixes.contains(value), value > 0 {
            arr1Prefixes.insert(value)
            value /= 10
        }
    }

    var result = 0

    for var value in arr2 {
        while !arr1Prefixes.contains(value), value > 0 {
            value /= 10
        }

        if value > 0 { result = max(result, String(value).count) }
    }

    return result
}