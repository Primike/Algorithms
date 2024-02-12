// Given three integers a, b, and c, return the longest possible happy string. 
// If there are multiple longest happy strings, return any of them. 
// If there is no such string, return the empty string "".

struct Letter: Comparable {
    let letter: Character
    var count: Int

    static func <(_ l: Letter, _ r: Letter) -> Bool {
        return (l.count, l.letter) < (r.count, r.letter)
    }
}

// Time: O(n), Space: O(n)
func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    var heap = Heap<Letter>(.maxHeap)
    if a != 0 { heap.push(Letter(letter: "a", count: a)) }
    if b != 0 { heap.push(Letter(letter: "b", count: b)) }
    if c != 0 { heap.push(Letter(letter: "c", count: c)) }

    var result = [Character]()

    while !heap.isEmpty {
        let length = result.count
        var first = heap.pop()!

        if length > 1, result.last! == first.letter, result[length - 2] == first.letter {
            if heap.isEmpty { return String(result) }

            var second = heap.pop()!
            result.append(second.letter)
            second.count -= 1

            if second.count > 0 { heap.push(second) }
            heap.push(first)
        } else {
            result.append(first.letter)
            first.count -= 1
            if first.count > 0 { heap.push(first) }
        }
    }

    return String(result)
}

print(longestDiverseString(1, 1, 7))
print(longestDiverseString(7, 1, 0))