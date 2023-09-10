// Return the minimum number of liters of fuel to reach the capital city 0.

func minimumFuelCost(_ roads: [[Int]], _ seats: Int) -> Int {
    var neighbors = [Int: [Int]]()

    for path in roads {
        neighbors[path[0], default: []].append(path[1])
        neighbors[path[1], default: []].append(path[0])
    }

    var result = 0

    func dfs(_ node: Int, _ parent: Int) -> Int {
        var passengers = 0

        for neighbor in neighbors[node, default: []] {
            if neighbor != parent {
                var p = dfs(neighbor, node)
                passengers += p
                
                let fullTrips = p / seats
                let partialTrip = p % seats > 0 ? 1 : 0
                
                result += fullTrips + partialTrip
            }
        }

        return passengers + 1
    }

    dfs(0, -1)
    return result
}

print(minimumFuelCost([[0,1],[0,2],[0,3]], 5))
print(minimumFuelCost([[3,1],[3,2],[1,0],[0,4],[0,5],[4,6]], 2))
print(minimumFuelCost([], 1))