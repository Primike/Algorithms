func canArrange(_ arr: [Int], _ k: Int) -> Bool {
    var dict = [Int: Int]()

    for number in arr {
        let remainder = (number % k + k) % k
        dict[remainder, default: 0] += 1
    }

    for number in arr {
        let remainder = (number % k + k) % k

        if remainder == 0 {
            if dict[remainder]! % 2 != 0 { return false }
        } else if dict[remainder] != dict[k - remainder, default: 0] {
            return false
        }
    }
    
    return true
}