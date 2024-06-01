// You are given the array paths, where paths[i] = [cityAi, cityBi]
// means there exists a direct path going from cityAi to cityBi. 
// Return the destination city, that is, the city 
// without any path outgoing to another city.

// Time: O(n), Space: O(n)
func destCity(_ paths: [[String]]) -> String {
    var valid = Set<String>()
    var nonValid = Set<String>()

    for path in paths { 
        nonValid.insert(path[0])
        valid.remove(path[0])
        valid.insert(path[1])
        
        if nonValid.contains(path[1]) { valid.remove(path[1]) }
    }

    return Array(valid)[0]
}

print(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
print(destCity([["B","C"],["D","B"],["C","A"]]))
print(destCity([["A","Z"]]))