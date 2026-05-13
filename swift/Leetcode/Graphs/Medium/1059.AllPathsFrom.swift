class Solution {
    private enum State {
        case gray
        case black
    }

    func leadsToDestination(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
        var graph = Array(repeating: [Int](), count: n)
        for edge in edges {
            graph[edge[0]].append(edge[1])
        }

        var states = Array<State?>(repeating: nil, count: n)
        return leadsToDest(graph, source, destination, &states)
    }

    private func leadsToDest(_ graph: [[Int]], _ node: Int, _ dest: Int, _ states: inout [State?]) -> Bool {
        if let state = states[node] {
            return state == .black
        }

        if graph[node].isEmpty {
            return node == dest
        }

        states[node] = .gray

        for nextNode in graph[node] {
            if !leadsToDest(graph, nextNode, dest, &states) {
                return false
            }
        }

        states[node] = .black
        return true
    }
}