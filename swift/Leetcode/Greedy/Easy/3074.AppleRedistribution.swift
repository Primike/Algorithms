// You are given an array apple of size n and an array capacity of size m.
// There are n packs where the ith pack contains apple[i] apples. 
// There are m boxes as well, and the ith box has a 
// capacity of capacity[i] apples.
// Return the minimum number of boxes you need to select 
// to redistribute these n packs of apples into boxes.

// Time: O(n * log(n)), Space: O(n)
func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
    let sortedCapacity = capacity.sorted(by: >)
    var apples = apple.reduce(0, +)
    
    for i in 0..<sortedCapacity.count {
        if apples <= 0 { return i }
        apples -= sortedCapacity[i]
    }

    return sortedCapacity.count
}

print(minimumBoxes([1,3,2], [4,3,1,5,2]))
print(minimumBoxes([5,5,5], [2,4,2,7]))