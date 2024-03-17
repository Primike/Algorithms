// You are given two jugs with capacities x liters and y liters. 
// You have an infinite water supply. Return whether the total amount 
// of water in both jugs may reach target using the following operations:
// Fill either jug completely with water.
// Completely empty either jug.
// Pour water from one jug into another until the receiving jug is full, 
// or the transferring jug is empty.

// Time: O(x * y), Space: O(x * y)
func canMeasureWater(_ x: Int, _ y: Int, _ target: Int) -> Bool {
    if x + y < target { return false }
    if target == 0 { return true }

    var visited = Set<String>()

    func dfs(_ i: Int, _ j: Int) -> Bool {
        let key = "\(i),\(j)"

        if i == target || j == target || i + j == target { return true }
        if visited.contains(key) { return false }

        visited.insert("\(i),\(j)")
        var result = dfs(x, j) || dfs(i, y) || dfs(0, j) || dfs(i, 0)
        var amount1 = min(i, y - j), amount2 = min(x - i, j)
        result = result || dfs(i - amount1, j + amount1) || dfs(i + amount2, j - amount2)

        return result
    }

    return dfs(0, 0)
}

print(canMeasureWater(3, 5, 4))
print(canMeasureWater(2, 6, 5))
print(canMeasureWater(1, 2, 3))