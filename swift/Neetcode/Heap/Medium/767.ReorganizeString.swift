// Given a string s, rearrange the characters of s so that any 
// two adjacent characters are not the same.
// Return any possible rearrangement of s or return "" if not possible.

struct Letter: Comparable {
    let letter: Character
    var count: Int

    static func <(_ l: Letter, _ r: Letter) -> Bool {
        return (l.count, l.letter) < (r.count, r.letter)
    }
}

// Time: O(n * log26), Space: O(n)
func reorganizeString(_ s: String) -> String {
    var dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Letter>(.maxHeap)

    for (key, value) in dict {
        heap.push(Letter(letter: key, count: value))
    }

    var result = ""

    while heap.count > 1 {
        var first = heap.pop()!, second = heap.pop()!

        result += String(first.letter) + String(second.letter)
        first.count -= 1
        second.count -= 1

        if first.count > 0 { heap.push(first) }
        if second.count > 0 { heap.push(second) }
    }

    if let first = heap.pop() {
        if first.count > 1 { return "" }
        result += String(first.letter)
    }

    return result
}

print(reorganizeString("aab"))
print(reorganizeString("aaab"))