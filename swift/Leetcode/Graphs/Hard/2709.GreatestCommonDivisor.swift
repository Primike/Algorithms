// Your task is to determine if for every pair of indices i and j in nums, 
// where i < j, there exists a sequence of traversals that can take us from i to j.
// Return true if it is possible to traverse between all such pairs of indices, 
// or false otherwise.

// Sieve of Eratosthenes
func canTraverseAllPairs(_ nums: [Int]) -> Bool {
    var roots = Array(0..<nums.count)
    var rank = Array(repeating: 1, count: nums.count)

    func getRoot(_ node: Int) -> Int {
        var node = node

        while node != roots[node] {
            roots[node] = roots[roots[node]]
            node = roots[node]                
        }

        return node
    }

    func merge(_ n1: Int, _ n2: Int) -> Bool {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return false }

        if rank[p1] > rank[p2] {
            rank[p1] += rank[p2]
            roots[p2] = p1
        } else {
            rank[p2] += rank[p1]
            roots[p1] = p2
        }

        return true
    }

    var factors = [Int: Int]() 

    for i in 0..<nums.count {
        var number = nums[i], factor = 2

        while factor * factor <= number {
            if number % factor == 0 {
                if let index = factors[factor] { merge(i, index) }
                factors[factor] = i

                while number % factor == 0 {
                    number /= factor
                }
            }

            factor += (factor == 2 ? 1 : 2)
        }

        if number > 1 {
            if let index = factors[number] { merge(i, index) }
            factors[number] = i
        }
    }

    let head = getRoot(0)

    for i in 1..<nums.count {
        if getRoot(i) != head { return false }
    }

    return true
}

print(canTraverseAllPairs([2,3,6]))
print(canTraverseAllPairs([3,9,5]))
print(canTraverseAllPairs([4,3,12,8]))