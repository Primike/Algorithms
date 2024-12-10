struct Alpha: Comparable {
    let cost: Int
    let ascii: Int

    static func < (_ l: Alpha, _ r: Alpha) -> Bool {
        return l.cost < r.cost
    }
}

func minimumCost(_ source: String, _ target: String, _ original: [Character], _ changed: [Character], _ cost: [Int]) -> Int {
    var paths = Array(repeating: [(Int, Int)](), count: 26)

    for i in 0..<original.count {
        let startAscii = Int(original[i].asciiValue!) - 97
        let endAscii = Int(changed[i].asciiValue!) - 97
        paths[startAscii].append((endAscii, cost[i]))
    }

    func dijkstra(_ letter: Int) -> [Int] {
        var heap = Heap<Alpha>(.minHeap, [(Alpha(cost: 0, ascii: letter))])
        var minCostsForLetter = Array(repeating: Int.max, count: 26)
        minCostsForLetter[letter] = 0

        while !heap.isEmpty {
            let closest = heap.pop()!

            if closest.cost > minCostsForLetter[closest.ascii] { continue }

            for (next, weight) in paths[closest.ascii] {

                if closest.cost + weight >= minCostsForLetter[next] { continue }
                
                minCostsForLetter[next] = closest.cost + weight
                heap.push(Alpha(cost: closest.cost + weight, ascii: next))
            }
        }

        return minCostsForLetter
    }

    var shortestPath = Array(repeating: Array(repeating: Int.max, count: 26), count: 26)

    for i in 0..<26 {
        shortestPath[i] = dijkstra(i)
    }

    let source = Array(source), target = Array(target)
    var result = 0

    for i in 0..<source.count {
        let sAscii = Int(source[i].asciiValue!) - 97
        let tAscii = Int(target[i].asciiValue!) - 97

        if sAscii == tAscii { continue }
        if shortestPath[sAscii][tAscii] == Int.max { return -1 }

        result += shortestPath[sAscii][tAscii]
    }

    return result
}

print(minimumCost("abcd", "acbe", ["a","b","c","c","e","d"], ["b","c","b","e","b","e"], [2,5,5,1,2,20]))
print(minimumCost("aaaa", "bbbb", ["a","c"], ["c","b"], [1,2]))
print(minimumCost("abcd", "abce", ["a"], ["e"], [10000]))