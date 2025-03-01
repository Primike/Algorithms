// You are given an array routes representing bus routes where 
// routes[i] is a bus route that the ith bus repeats forever.
// You will start at the bus stop source (You are not on any bus initially), 
// and you want to go to the bus stop target. 
// You can travel between bus stops by buses only.
// Return the least number of buses you must take to travel from source to target. 
// Return -1 if it is not possible.

// Time: O(n * s), Space: O(n * s)
func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target { return 0 }

    let routes = routes.map { Set($0) }
    var stopToBuses = [Int: Set<Int>]()

    for (i, route) in routes.enumerated() {
        for stop in route {
            stopToBuses[stop, default: []].insert(i)
        }
    }

    var neighbors = Array(repeating: Set<Int>(), count: routes.count)

    for (i, route) in routes.enumerated() {
        for stop in route {
            neighbors[i].formUnion(stopToBuses[stop, default: []].filter { $0 != i })
        }
    }

    var visited = stopToBuses[source, default: []]
    var queue = Array(stopToBuses[source, default: []])
    var buses = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            if routes[first].contains(target) { return buses }

            for next in neighbors[first] {
                if visited.contains(next) { continue }

                queue.append(next)
                visited.insert(next)
            }
        }

        buses += 1
    }

    return -1
}

print(numBusesToDestination([[1,2,7],[3,6,7]], 1, 6))
print(numBusesToDestination([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12))