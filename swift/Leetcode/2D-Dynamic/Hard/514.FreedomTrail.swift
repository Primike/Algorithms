// Given a string ring that represents the code engraved on the outer ring 
// and another string key that represents the keyword that needs to be spelled, 
// return the minimum number of steps to spell all the characters in the keyword.

// Time: O(m^2 * n), Space: O(m * n)
func findRotateSteps(_ ring: String, _ key: String) -> Int {
    let ring = Array(ring), key = Array(key)
    var memo = [String: Int]()

    func dp(_ r: Int, _ k: Int) -> Int {
        let path = "\(r),\(k)"

        if k == key.count { return 0 }
        if let value = memo[path] { return value }

        var result = Int.max

        for (i, letter) in ring.enumerated() {
            if letter != key[k] { continue }
            
            let closest = min(abs(r - i), ring.count - abs(r - i))
            result = min(result, closest + 1 + dp(i, k + 1))
        }

        memo[path] = result
        return result
    }

    return dp(0, 0)
}

print(findRotateSteps("godding", "gd"))
print(findRotateSteps("godding", "godding"))