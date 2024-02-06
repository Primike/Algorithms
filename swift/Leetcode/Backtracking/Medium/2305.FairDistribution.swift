// The unfairness of a distribution is defined as the maximum total cookies 
// obtained by a single child in the distribution.
// Return the minimum unfairness of all distributions.

// Time: O(k^n), Space: O(n + k)
func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
    var children = Array(repeating: 0, count: k)
    var result = Int.max

    func backtrack(_ index: Int) {
        if index == cookies.count {
            result = min(result, children.max()!)
            return
        }

        for i in 0..<k {
            children[i] += cookies[index]
            backtrack(index + 1)
            children[i] -= cookies[index]

            if children[i] >= result { break }
        }
    }

    backtrack(0)
    return result
}

print(distributeCookies([8,15,10,20,8], 2))
print(distributeCookies([6,1,3,2,2,4,1,2], 3))