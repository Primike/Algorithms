// You are given a 0-indexed 2D integer array pairs 
// where pairs[i] = [starti, endi]. An arrangement of pairs 
// is valid if for every index i where 1 <= i < pairs.length, 
// we have endi-1 == starti.
// Return any valid arrangement of pairs.
// Note: The inputs will be generated such that there 
// exists a valid arrangement of pairs.

func validArrangement(_ pairs: [[Int]]) -> [[Int]] {
    var adjacencyMatrix = [Int: [Int]]()
    var inDegree = [Int: Int]()
    var outDegree = [Int: Int]()

    for pair in pairs {
        let start = pair[0], end = pair[1]
        adjacencyMatrix[start, default: []].append(end)
        outDegree[start, default: 0] += 1
        inDegree[end, default: 0] += 1
    }

    var result = [Int]()
    var startNode = -1

    for node in outDegree.keys {
        if outDegree[node, default: 0] == inDegree[node, default: 0] + 1 {
            startNode = node
            break
        }
    }

    if startNode == -1 {
        startNode = pairs[0][0]
    }

    var nodeStack = [startNode]

    while !nodeStack.isEmpty {
        let node = nodeStack.last!
        if let neighbors = adjacencyMatrix[node], !neighbors.isEmpty {
            let nextNode = adjacencyMatrix[node]!.removeFirst()
            nodeStack.append(nextNode)
        } else {
            result.append(node)
            nodeStack.removeLast()
        }
    }

    result.reverse()

    var pairedResult = [[Int]]()
    for i in 1..<result.count {
        pairedResult.append([result[i - 1], result[i]])
    }

    return pairedResult
}

print(validArrangement([[5,1],[4,5],[11,9],[9,4]]))
print(validArrangement([[1,3],[3,2],[2,1]]))
print(validArrangement([[1,2],[1,3],[2,1]]))