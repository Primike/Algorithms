// Return true if it is possible to obtain the target triplet [x, y, z] 
// as an element of triplets, or false otherwise.

// Time: O(n), Space: O(1)
func mergeTriplets(_ triplets: [[Int]], _ target: [Int]) -> Bool {
    var good = Set<Int>()

    for triplet in triplets {
        if triplet[0] > target[0] || triplet[1] > target[1] || triplet[2] > target[2] {
            continue
        }
        
        for (i, value) in triplet.enumerated() {
            if value == target[i] { good.insert(i) }
        }
    }

    return good.count == 3
}

print(mergeTriplets([[2,5,3],[1,8,4],[1,7,5]], [2,7,5]))
print(mergeTriplets([[3,4,5],[4,5,6]], [3,2,5]))
print(mergeTriplets([[2,5,3],[2,3,4],[1,2,5],[5,2,3]], [5,5,5]))