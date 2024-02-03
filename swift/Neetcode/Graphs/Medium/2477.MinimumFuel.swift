// Return the minimum number of liters of fuel to reach the capital city 0.

// Time: O(n), Space: O(n)
func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
    var neighbors = Array(repeating: [Int](), count: roads.count + 1)

    for road in roads {
        neighbors[road[0]].append(road[1])
        neighbors[road[1]].append(road[0])
    }

    var result = 0

    func dfs(_ n: Int, _ parent: Int) -> Int {            
        var passengers = 1

        for node in neighbors[n] {
            if parent == node { continue }

            let people = dfs(node, n)
            result += (people + seats - 1) / seats
            passengers += people
        }

        return passengers
    }

    dfs(0, -1)
    return result
}

print(minimumFuelCost([[0,1],[0,2],[0,3]], 5))
print(minimumFuelCost([[3,1],[3,2],[1,0],[0,4],[0,5],[4,6]], 2))
print(minimumFuelCost([], 1))