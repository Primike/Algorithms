// You are given an array of strings names, and an array heights 
// that consists of distinct positive integers. Both arrays are of length n.
// For each index i, names[i] and heights[i] denote the name and height of the ith person.
// Return names sorted in descending order by the people's heights.

// Time: O(n * log(n)), Space: O(n)
func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
    return zip(names, heights).map { ($0.0, $0.1) }.sorted { $0.1 > $1.1 }.map { $0.0 }
}

print(sortPeople(["Mary","John","Emma"], [180,165,170]))
print(sortPeople(["Alice","Bob","Bob"], [155,185,150]))