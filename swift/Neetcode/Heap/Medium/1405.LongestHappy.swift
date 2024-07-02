// Given three integers a, b, and c, return the longest possible happy string. 
// If there are multiple longest happy strings, return any of them. 
// If there is no such string, return the empty string "".

struct Letter: Comparable {
    let letter: String
    var count: Int

    static func <(_ l: Letter, _ r: Letter) -> Bool {
        return (l.count, l.letter) < (r.count, r.letter)
    }
}

// Time: O(a + b + c), Space: O(3)
func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    var heap = Heap<Letter>(.maxHeap)
    
    if a != 0 { heap.push(Letter(letter: "a", count: a)) }
    if b != 0 { heap.push(Letter(letter: "b", count: b)) }
    if c != 0 { heap.push(Letter(letter: "c", count: c)) }

    var result = ""

    while var largest = heap.pop() {
        if let last = result.last, String(last) == largest.letter {
            if heap.isEmpty { return result }

            var second = heap.pop()!
            result += second.letter
            second.count -= 1

            if second.count > 0 { heap.push(second) }
            heap.push(largest)
        } else {
            let count = largest.count == 1 ? 1 : 2
            result += String(repeating: largest.letter, count: count)
            largest.count -= count
            if largest.count > 0 { heap.push(largest) }
        }
    }

    return result
}

print(longestDiverseString(1, 1, 7))
print(longestDiverseString(7, 1, 0))