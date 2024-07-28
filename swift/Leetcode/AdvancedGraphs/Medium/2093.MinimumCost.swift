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

    var costForCity = Array(repeating: Array(repeating: Int.max, count: discounts + 1), count: n)
    costForCity[0][discounts] = 0
    var heap = Heap<City>(.minHeap, [City(city: 0, cost: 0, discounts: discounts)])

    while !heap.isEmpty {
        let closest = heap.pop()!

        if closest.cost > costForCity[closest.city][closest.discounts] { continue }

        for (next, toll) in neighbors[closest.city] {
            let payFull = closest.cost + toll
            let payDiscount = closest.cost + toll / 2

            if costForCity[next][closest.discounts] > payFull { 
                heap.push(City(city: next, cost: payFull, discounts: closest.discounts))
                costForCity[next][closest.discounts] = payFull
            }

            if closest.discounts > 0, costForCity[next][closest.discounts - 1] > payDiscount {
                heap.push(City(city: next, cost: payDiscount, discounts: closest.discounts - 1))
                costForCity[next][closest.discounts - 1] = payDiscount
            }
        }
    }

    let result = costForCity[n - 1].min() ?? -1
    return result == Int.max ? -1 : result
}

print(minimumCost(5, [[0,1,4],[2,1,3],[1,4,11],[3,2,3],[3,4,2]], 1))
print(minimumCost(4, [[1,3,17],[1,2,7],[3,2,5],[0,1,6],[3,0,20]], 20))
print(minimumCost(4, [[0,1,3],[2,3,2]], 0))