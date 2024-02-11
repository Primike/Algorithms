// You are given an array routes representing bus routes where 
// routes[i] is a bus route that the ith bus repeats forever.
// You will start at the bus stop source (You are not on any bus initially), 
// and you want to go to the bus stop target. 
// You can travel between bus stops by buses only.
// Return the least number of buses you must take to travel from source to target. 
// Return -1 if it is not possible.

func numBusesToDestination(_ routes: [[Int]], _ source: Int, _ target: Int) -> Int {
    if source == target { return 0 }

    var stopToBuses = [Int: [Int]]()

    for (i, route) in routes.enumerated() {
        for stop in route {
            stopToBuses[stop, default: []].append(i)
        }
    }

    var visitedBuses = Set<Int>()
    var visitedStops = Set([source])
    var queue = [source]
    var result = 0

    while !queue.isEmpty {
        result += 1
        
        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            for bus in stopToBuses[first, default: []] {
                if visitedBuses.contains(bus) { continue }
                visitedBuses.insert(bus)

                for stop in routes[bus] {
                    if stop == target { return result }
                    if visitedStops.contains(stop) { continue }

                    visitedStops.insert(stop)
                    queue.append(stop)
                }
            }
        }
    }

    return -1
}

print(numBusesToDestination([[1,2,7],[3,6,7]], 1, 6))
print(numBusesToDestination([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12))