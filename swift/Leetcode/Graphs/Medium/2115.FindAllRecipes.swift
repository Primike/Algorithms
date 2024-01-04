// Return a list of all the recipes that you can create. 
// You may return the answer in any order.

func findAllRecipes(_ recipes: [String], _ ingredients: [[String]], _ supplies: [String]) -> [String] {
    var supplies = Set(supplies)
    var dict = [String: [String]]()

    for i in 0..<recipes.count {
        dict[recipes[i]] = ingredients[i]
    }

    var result = [String]()
    var visited = [String: Bool]()

    func dfs(_ recipe: String) -> Bool {
        if let value = visited[recipe] { return value }

        visited[recipe] = false 

        for item in dict[recipe, default: []] {
            if supplies.contains(item) { continue }
            
            if dict.keys.contains(item) {
                if !dfs(item) { return false }
            } else {
                return false
            }
        }

        visited[recipe] = true
        result.append(recipe)
        supplies.insert(recipe)
        return true
    }

    for recipe in recipes {
        dfs(recipe)
    }

    return result
}

print(findAllRecipes(["bread"], [["yeast","flour"]], ["yeast","flour","corn"]))
print(findAllRecipes(["bread","sandwich"], [["yeast","flour"],["bread","meat"]], ["yeast","flour","meat"]))
print(findAllRecipes(["bread","sandwich","burger"], 
    [["yeast","flour"],["bread","meat"],["sandwich","meat","bread"]], 
    ["yeast","flour","meat"]))