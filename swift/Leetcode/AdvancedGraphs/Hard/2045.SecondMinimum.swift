// The time taken to traverse any edge is time minutes.
// Each vertex has a traffic signal which changes its color from 
// green to red and vice versa every change minutes. 
// All signals change at the same time. You can enter a vertex at any time, 
// but can leave a vertex only when the signal is green. 
// You cannot wait at a vertex if the signal is green.
// The second minimum value is defined as the smallest value 
// strictly larger than the minimum value.
// Given n, edges, time, and change, return the second minimum time 
// it will take to go from vertex 1 to vertex n.

func secondMinimum(_ n: Int, _ edges: [[Int]], _ time: Int, _ change: Int) -> Int {
    var neighbors = Array(repeating: [Int](), count: n + 1)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }
    
    var passOne = Array(repeating: -1, count: n + 1)
    var passTwo = Array(repeating: -1, count: n + 1)
    var queue = [(1, 1)]
    passOne[1] = 0
    
    while !queue.isEmpty {
        let (node, pass) = queue.removeFirst()
        var timeTaken = pass == 1 ? passOne[node] : passTwo[node]
        let rounds = timeTaken / change
        
        if rounds % 2 == 1 {
            timeTaken = change * (rounds + 1) + time
        } else {
            timeTaken += time
        }
        
        for next in neighbors[node] {
            if passOne[next] == -1 {
                passOne[next] = timeTaken
                queue.append((next, 1))
            } else if passTwo[next] == -1, passOne[next] != timeTaken {
                if next == n { return timeTaken }
                passTwo[next] = timeTaken
                queue.append((next, 2))
            }
        }
    }
    
    return 0
}

print(secondMinimum(5, [[1,2],[1,3],[1,4],[3,4],[4,5]], 3, 5))
print(secondMinimum(2, [[1,2]], 3, 2))