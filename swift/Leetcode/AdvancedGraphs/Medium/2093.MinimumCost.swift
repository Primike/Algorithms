// You are also given an integer discounts which represents 
// the number of discounts you have. You can use a discount to 
// travel across the ith highway for a cost of tolli / 2 (integer division). 
// Each discount may only be used once, and you can only use at most one discount per highway.
// Return the minimum total cost to go from city 0 to city n - 1, or -1 
// if it is not possible to go from city 0 to city n - 1.

struct City: Comparable {
    let city: Int
    let cost: Int
    let discounts: Int

    static func < (_ l: City, _ r: City) -> Bool {
        return l.cost < r.cost
    }
}

// Time: O((n * d + e) * log(n * d)), Space: O(n * d + e)
func minimumCost(_ n: Int, _ highways: [[Int]], _ discounts: Int) -> Int {
    var neighbors = Array(repeating: [(Int, Int)](), count: n)

    for highway in highways {
        neighbors[highway[0]].append((highway[1], highway[2]))
        neighbors[highway[1]].append((highway[0], highway[2]))
    }

    var heap = Heap<City>(.minHeap, [City(city: 0, cost: 0, discounts: discounts)])
    var visited = [String: Int]()

    while !heap.isEmpty {
        let first = heap.pop()!
        if first.city == n - 1 { return first.cost }

        for (node, weight) in neighbors[first.city] {
            let newCost1 = first.cost + weight
            let key1 = "\(node),\(first.discounts)"

            if visited[key1, default: Int.max] > newCost1 {
                visited[key1] = newCost1
                heap.push(City(city: node, cost: newCost1, discounts: first.discounts))
            }

            let newDiscounts = first.discounts - 1
            let newCost2 = first.cost + weight / 2
            let key2 = "\(node),\(newDiscounts)"

            if newDiscounts >= 0, visited[key2, default: Int.max] > newCost2 {
                visited[key2] = newCost2
                heap.push(City(city: node, cost: newCost2, discounts: newDiscounts))
            }
        }
    }

    return -1
}

print(minimumCost(5, [[0,1,4],[2,1,3],[1,4,11],[3,2,3],[3,4,2]], 1))
print(minimumCost(4, [[1,3,17],[1,2,7],[3,2,5],[0,1,6],[3,0,20]], 20))
print(minimumCost(4, [[0,1,3],[2,3,2]], 0))