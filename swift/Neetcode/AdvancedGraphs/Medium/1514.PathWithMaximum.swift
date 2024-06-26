// Given two nodes start and end, find the path with the maximum probability 
// of success to go from start to end and return its success probability.
// If there is no path from start to end, return 0. Your answer will be accepted 
// if it differs from the correct answer by at most 1e-5.

struct Node: Comparable {
    let n: Int
    let probability: Double 

    static func < (_ l: Node, _ r: Node) -> Bool {
        return l.probability < r.probability
    }
}

// Time: O(e * logn), Space: O(n + e)
func maxProbability(_ n: Int, _ edges: [[Int]], _ succProb: [Double], _ start_node: Int, _ end_node: Int) -> Double {
    var neighbors = Array(repeating: [(Int, Double)](), count: n)

    for i in 0..<edges.count {
        neighbors[edges[i][0]].append((edges[i][1], succProb[i]))
        neighbors[edges[i][1]].append((edges[i][0], succProb[i]))
    }

    var heap = Heap<Node>(.maxHeap, [Node(n: start_node, probability: 1.0)])
    var visited = Set<Int>()

    while !heap.isEmpty {
        let mostProbable = heap.pop()!

        if mostProbable.n == end_node { return mostProbable.probability }
        if visited.contains(mostProbable.n) { continue }
        
        visited.insert(mostProbable.n)

        for node in neighbors[mostProbable.n] {
            if visited.contains(node.0) { continue }

            let newProbability = mostProbable.probability * node.1
            heap.push(Node(n: node.0, probability: newProbability))
        }
    }

    return 0
}

print(maxProbability(3, [[0,1],[1,2],[0,2]], [0.5,0.5,0.2], 0, 2))
print(maxProbability(3, [[0,1],[1,2],[0,2]], [0.5,0.5,0.3], 0, 2))
print(maxProbability(3, [[0,1]], [0.5], 0, 2))