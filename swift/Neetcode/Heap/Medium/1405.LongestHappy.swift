// Given three integers a, b, and c, return the longest possible happy string. 
// If there are multiple longest happy strings, return any of them. 
// If there is no such string, return the empty string "".

struct Alpha: Comparable {
    let alpha: Character
    let count: Int
    
    static func < (lhs: Alpha, rhs: Alpha) -> Bool {
        return lhs.count < rhs.count
    }
}

func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    var maxHeap = Heap<Alpha>(type: .maxHeap)
    if a > 0 { maxHeap.push(Alpha(alpha: "a", count: a)) }
    if b > 0 { maxHeap.push(Alpha(alpha: "b", count: b)) }
    if c > 0 { maxHeap.push(Alpha(alpha: "c", count: c)) }

    var result = [Character]()

    while !maxHeap.isEmpty {
        var first = maxHeap.pop()!
        var change = 0

        if result.count > 1, result.last! == first.alpha, result[result.count - 2] == first.alpha {
            if maxHeap.isEmpty { break }

            let second = maxHeap.pop()!
            result.append(second.alpha)

            if second.count - 1 > 0 {
                maxHeap.push(Alpha(alpha: second.alpha, count: second.count - 1))
            }
        } else {
            result.append(first.alpha)
            change += 1
        }

        if first.count - change > 0 {
            maxHeap.push(Alpha(alpha: first.alpha, count: first.count - change))
        }
    }
    
    return String(result)
}

print(longestDiverseString(1, 1, 7))
print(longestDiverseString(7, 1, 0))