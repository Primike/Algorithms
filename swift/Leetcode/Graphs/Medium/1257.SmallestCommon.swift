// Naturally, if a region x contains another region y 
// then x is bigger than y. Also, by definition, 
// a region x contains itself.
// Given two regions: region1 and region2, 
// return the smallest region that contains both of them.
// If you are given regions r1, r2, and r3 such that 
// r1 includes r3, it is guaranteed there is no r2 
// such that r2 includes r3.

// Time: O(m * n), Space: O(m * n)
func findSmallestRegion(_ regions: [[String]], _ region1: String, _ region2: String) -> String {
    var roots = Set(regions.map { $0[0] })
    var paths = [String: [String]]()

    for region in regions {
        var array = [String]()

        for i in 1..<region.count {
            array.append(region[i])
            roots.remove(region[i])
        }   

        paths[region[0], default: []] += array
    }

    func dfs(_ node: String) -> (String, Bool) {
        var count = node == region1 || node == region2 ? 1 : 0

        for next in paths[node, default: []] {
            let (string, bool) = dfs(next)

            if string != "" { return (string, bool) }
            if bool { count += 1 }
            if count == 2 { return (node, true) }
        }

        return ("", count > 0)
    }

    return dfs(Array(roots)[0]).0
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