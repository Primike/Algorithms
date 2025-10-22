// Return a list of all the recipes that you can create. 
// You may return the answer in any order.

// Time: O(n + I), Space: O(n + I)
func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
    var paths = [String: [String]]()

    for i in 0..<recipes.count {
        paths[recipes[i]] = ingredients[i]
    }

    var supplies = Set(supplies)
    var visited = Set<String>()

    func dfs(_ node: String) -> Bool {
        if supplies.contains(node) { return true }
        if visited.contains(node) { return false }
        if paths[node, default: []].isEmpty { return false }

        visited.insert(node)
        var canCreate = true

        for next in paths[node, default: []] {
            canCreate = canCreate && dfs(next)
        }

        visited.remove(node)
        if canCreate { supplies.insert(node) }
        return canCreate
    }

    var result = [String]()

    for recipe in paths.keys {
        if dfs(recipe) { result.append(recipe) }
    }

    return result
}

print(findAllRecipes(["bread"], [["yeast","flour"]], ["yeast","flour","corn"]))
print(findAllRecipes(["bread","sandwich"], [["yeast","flour"],["bread","meat"]], ["yeast","flour","meat"]))
print(findAllRecipes(["bread","sandwich","burger"], 
    [["yeast","flour"],["bread","meat"],["sandwich","meat","bread"]], 
    ["yeast","flour","meat"]))