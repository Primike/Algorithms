// Given three integers a, b, and c, return the longest possible happy string. 
// If there are multiple longest happy strings, return any of them. 
// If there is no such string, return the empty string "".

struct Alpha: Comparable {
    let letter: Character
    var count: Int

    static func <(left: Alpha, right: Alpha) -> Bool {
        return left.count < right.count
    }
}

func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
    var heap = Heap<Alpha>(type: .maxHeap)

    if a != 0 { heap.push(Alpha(letter: "a", count: a)) }
    if b != 0 { heap.push(Alpha(letter: "b", count: b)) }
    if c != 0 { heap.push(Alpha(letter: "c", count: c)) }

    var result = [Character]()

    while !heap.isEmpty {
        var first = heap.pop()!

        if result.count > 1, result.last! == first.letter, result[result.count - 2] == first.letter {
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