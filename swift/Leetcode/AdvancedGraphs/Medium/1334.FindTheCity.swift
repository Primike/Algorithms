// Return the city with the smallest number of cities that are reachable 
// through some path and whose distance is at most distanceThreshold, 
// If there are multiple such cities, return the city with the greatest number.
// Notice that the distance of a path connecting cities i and j 
// is equal to the sum of the edges' weights along that path.

struct City: Comparable {
    let city: Int
    var distance: Int

    static func < (_ l: City, _ r: City) -> Bool {
        return l.distance < r.distance
    }
}

// Time: O(n^3 * log(n)), Space: O(n^2)
func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
    var neighbors = Array(repeating: [(Int, Int)](), count: n)
    var reachable = Array(0..<n)

    for edge in edges {
        neighbors[edge[0]].append((edge[1], edge[2]))
        neighbors[edge[1]].append((edge[0], edge[2]))
    }

    func dijkstra(_ city: Int) {
        var heap = Heap<City>(.minHeap, [City(city: city, distance: 0)])
        var distances = Array(repeating: Int.max, count: n)
        distances[city] = 0

        while !heap.isEmpty {
            let closest = heap.pop()!

            for (node, weight) in neighbors[closest.city] {
                if closest.distance > distanceThreshold { continue }
                if closest.distance + weight >= distances[node] { continue }

                distances[node] = closest.distance + weight
                heap.push(City(city: node, distance: closest.distance + weight))
            }
        }

        reachable[city] = distances.filter { $0 <= distanceThreshold }.count - 1
    }

    var result = Int.max, cities = Int.max

    for i in (0..<n).reversed() {
        dijkstra(i)

        if reachable[i] < cities {
            cities = reachable[i]
            result = i
        }
    }

    return result
}

print(findTheCity(4, [[0,1,3],[1,2,1],[1,3,4],[2,3,1]], 4))
print(findTheCity(5, [[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]], 2))