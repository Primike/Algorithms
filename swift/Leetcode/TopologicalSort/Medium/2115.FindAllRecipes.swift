// Return a list of all the recipes that you can create. 
// You may return the answer in any order.

// Time: O(n + I), Space: O(n + I)
func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
    var finished = supplies.reduce(into: [:]) { $0[$1] = true }
    var paths = [String: [String]]()

    for i in 0..<recipes.count {
        paths[recipes[i], default: []] += ingredients[i]
    }

    var visited = Set<String>()

    func dfs(_ n: String) -> Bool {
        if visited.contains(n) { return false }
        if let value = finished[n] { return value }

        visited.insert(n)

        for node in paths[n, default: []] {
            if !dfs(node) {
                finished[n] = false
                return false
            }
        }        

        visited.remove(n)
        finished[n] = true
        return true
    }

    var result = [String]()
    
    for i in 0..<recipes.count {
        if dfs(recipes[i]) { result.append(recipes[i]) }
    }

    return result
}

print(findAllRecipes(["bread"], [["yeast","flour"]], ["yeast","flour","corn"]))
print(findAllRecipes(["bread","sandwich"], [["yeast","flour"],["bread","meat"]], ["yeast","flour","meat"]))
print(findAllRecipes(["bread","sandwich","burger"], 
    [["yeast","flour"],["bread","meat"],["sandwich","meat","bread"]], 
    ["yeast","flour","meat"]))