// Given two integers n and k, return the kth lexicographically 
// smallest integer in the range [1, n].

func findKthNumber(_ n: Int, _ k: Int) -> Int {
    func countSteps(_ n: Int, _ prefix1: Int, _ prefix2: Int) -> Int {
        var steps = 0
        var prefix1 = prefix1
        var prefix2 = prefix2
        
        while prefix1 <= n {
            steps += min(n + 1, prefix2) - prefix1
            prefix1 *= 10
            prefix2 *= 10
        }
        
        return steps
    }

    var result = 1
    var k = k - 1
    
    while k > 0 {
        let step = countSteps(n, result, result + 1)
        
        if step <= k {
            result += 1
            k -= step
        } else {
            result *= 10
            k -= 1
        }
    }
    
    return result
}

print(findKthNumber(13, 2))
print(findKthNumber(1, 1))