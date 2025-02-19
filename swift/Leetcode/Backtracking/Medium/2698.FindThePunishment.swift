// Given a positive integer n, return the punishment number of n.
// The punishment number of n is defined as the sum of the 
// squares of all integers i such that:
// 1 <= i <= n
// The decimal representation of i * i can be partitioned 
// into contiguous substrings such that the sum of the 
// integer values of these substrings equals i.
 
// Time: O(n * 2^n), Space: O(n^2)
func punishmentNumber(_ n: Int) -> Int {
    var memo = [String: Bool]()
    var target = 0

    func backtrack(_ number: String, _ sum: Int) -> Bool {
        let key = "\(number),\(sum)"

        if number.isEmpty { return sum == target }
        if let value = memo[key] { return false }

        var number = number
        var current = ""
        
        for _ in 0..<number.count {
            current.append(number.removeFirst())
            if backtrack(number, sum + Int(current)!) { return true }
        }

        memo[key] = false
        return false
    }

    var result = 0

    for i in 1...n {
        target = i
        if backtrack(String(i * i), 0) { result += i * i }
        memo = [:]
    }

    return result
}