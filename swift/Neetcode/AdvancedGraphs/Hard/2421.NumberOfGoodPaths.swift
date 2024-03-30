// A good path is a simple path that satisfies the following conditions:
// The starting node and the ending node have the same value.
// All nodes between the starting node and the ending node have values 
// less than or equal to the starting node 
// (i.e. the starting node's value should be the maximum value along the path).
// Return the number of distinct good paths.

// Time: O(n * logn), Space: O(n)
func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {
    var root = Array(0..<vals.count)
    var rank = Array(repeating: 1, count: vals.count)

    func getRoot(_ n: Int) -> Int {
        var n = root[n]

        while n != root[n] {
            root[n] = root[root[n]]
            n = root[n]
        }

        return n
    }

    func mergeRoots(_ n1: Int, _ n2: Int) {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return }

        if rank[p1] >= rank[p2] {
            root[p2] = p1
            rank[p1] += rank[p2]
        } else {
            root[p1] = p2
            rank[p2] += rank[p1]
        }
    }

    var neighbors = Array(repeating: [Int](), count: vals.count)
    var valuesToNodes = [Int: [Int]]()

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    for i in 0..<vals.count {
        valuesToNodes[vals[i], default: []].append(i)
    }

    var result = 0

    for value in valuesToNodes.keys.sorted() {
        guard let nodes = valuesToNodes[value] else { continue }

        for node in nodes {
            for n in neighbors[node] {
                if vals[node] >= vals[n] { mergeRoots(node, n) }
            }
        }

        var group = [Int: Int]()
        
        for node in nodes {
            group[getRoot(node), default: 0] += 1
        }

        for (root, size) in group {
            result += size * (size + 1) / 2
        }
    }

    return result
}

print(numberOfGoodPaths([1,3,2,1,3], [[0,1],[0,2],[2,3],[2,4]]))
print(numberOfGoodPaths([1,1,2,2,3], [[0,1],[1,2],[2,3],[2,4]]))
print(numberOfGoodPaths([1], []))