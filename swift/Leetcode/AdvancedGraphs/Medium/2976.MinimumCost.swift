struct Alpha: Comparable {
    let cost: Int
    let index: Int

    static func < (_ l: Alpha, _ r: Alpha) -> Bool {
        return l.cost < r.cost
    }
}

func minimumCost(_ source: String, _ target: String, _ original: [Character], _ changed: [Character], _ cost: [Int]) -> Int {
    var paths = Array(repeating: [(Int, Int)](), count: 26)

    for i in 0..<original.count {
        let start = Int(original[i].asciiValue!) - 97
        let end = Int(changed[i].asciiValue!) - 97
        paths[start].append((end, cost[i]))
    }

    func dijkstra(_ start: Int) -> [Int] {
        var heap = Heap<Alpha>(.minHeap, [(Alpha(cost: 0, index: start))])
        var minCosts = Array(repeating: Int.max, count: 26)
        minCosts[start] = 0

        while !heap.isEmpty {
            let closest = heap.pop()!

            if closest.cost > minCosts[closest.index] { continue }

            for (next, weight) in paths[closest.index] {
                if closest.cost + weight >= minCosts[next] { continue }
                
                minCosts[next] = closest.cost + weight
                heap.push(Alpha(cost: closest.cost + weight, index: next))
            }
        }

        return minCosts
    }

    var pathCosts = Array(repeating: Array(repeating: Int.max, count: 26), count: 26)

    for i in 0..<26 {
        pathCosts[i] = dijkstra(i)
    }

    let source = Array(source), target = Array(target)
    var result = 0

    for i in 0..<source.count {
        let sIndex = Int(source[i].asciiValue!) - 97
        let tIndex = Int(target[i].asciiValue!) - 97

        if sIndex == tIndex { continue }
        if pathCosts[sIndex][tIndex] == Int.max { return -1 }

        result += pathCosts[sIndex][tIndex]
    }

    return result
}

print(minimumCost("abcd", "acbe", ["a","b","c","c","e","d"], ["b","c","b","e","b","e"], [2,5,5,1,2,20]))
print(minimumCost("aaaa", "bbbb", ["a","c"], ["c","b"], [1,2]))
print(minimumCost("abcd", "abce", ["a"], ["e"], [10000]))