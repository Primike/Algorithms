// Naturally, if a region x contains another region y 
// then x is bigger than y. Also, by definition, 
// a region x contains itself.
// Given two regions: region1 and region2, 
// return the smallest region that contains both of them.
// If you are given regions r1, r2, and r3 such that 
// r1 includes r3, it is guaranteed there is no r2 
// such that r2 includes r3.

func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
    var childParentMap = [String: String]()

    for regionArray in regions {
        let parentNode = regionArray[0]

        for i in 1..<regionArray.count {
            childParentMap[regionArray[i]] = parentNode
        }
    }

    func fetchPathForRegion(_ currNode: String, _ childParentMap: [String: String]) -> [String] {
        var path = [currNode]
        var currentNode = currNode

        while let parentNode = childParentMap[currentNode] {
            path.append(parentNode)
            currentNode = parentNode
        }

        return path.reversed()
    }

    let path1 = fetchPathForRegion(region1, childParentMap)
    let path2 = fetchPathForRegion(region2, childParentMap)
    var i = 0, j = 0
    var result = ""

    while i < path1.count, j < path2.count, path1[i] == path2[j] {
        result = path1[i]
        i += 1
        j += 1
    }

    return result
}

print(findSmallestRegion([
    ["Earth","North America","South America"],
    ["North America","United States","Canada"],
    ["United States","New York","Boston"],
    ["Canada","Ontario","Quebec"],
    ["South America","Brazil"]], "Quebec", "New York"))
print(findSmallestRegion([
    ["Earth", "North America", "South America"],
    ["North America", "United States", "Canada"],
    ["United States", "New York", "Boston"],
    ["Canada", "Ontario", "Quebec"],
    ["South America", "Brazil"]], "Canada", "South America"))