// There are n cities connected by some number of flights. 
// You are given an array flights where flights[i] = [fromi, toi, pricei] 
// indicates that there is a flight from city fromi to city toi with cost pricei.
// You are also given three integers src, dst, and k, 
// return the cheapest price from src to dst with at most k stops. 
// If there is no such route, return -1.

struct Stop: Comparable {
    let n: Int
    let price: Int
    let stops: Int

    static func < (_ l: Stop, _ r: Stop) -> Bool {
        return l.price < r.price
    }
}

func findCheapestPrice(_ n: Int, _ flights: [[Int]], _ src: Int, _ dst: Int, _ k: Int) -> Int {
    var paths = Array(repeating: [(Int, Int)](), count: n)

    for flight in flights {
        paths[flight[0]].append((flight[1], flight[2]))
    }

    var heap = Heap<Stop>(.minHeap, [Stop(n: src, price: 0, stops: 0)])
    var visited = [Int: Int]()

    while !heap.isEmpty {
        let cheapest = heap.pop()!

        if let stops = visited[cheapest.n], stops <= cheapest.stops { continue }
        if cheapest.n == dst, cheapest.stops - 1 <= k { return cheapest.price }

        visited[cheapest.n] = cheapest.stops

        for stop in paths[cheapest.n] {
            heap.push(Stop(n: stop.0, price: cheapest.price + stop.1, stops: cheapest.stops + 1))
        }
    }

    return -1
}

print(findCheapestPrice(4, [[0,1,100],[1,2,100],[2,0,100],[1,3,600],[2,3,200]], 0, 3, 1))
print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 1))
print(findCheapestPrice(3, [[0,1,100],[1,2,100],[0,2,500]], 0, 2, 0))