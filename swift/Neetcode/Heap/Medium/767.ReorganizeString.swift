// Given a string s, rearrange the characters of s so that any 
// two adjacent characters are not the same.
// Return any possible rearrangement of s or return "" if not possible.

struct Alpha: Comparable {
    let letter: Character
    let count: Int

    static func <(left: Alpha, right: Alpha) -> Bool {
        return left.count < right.count
    }
}

// Time: nlog(26), Space: n
func reorganizeString(_ s: String) -> String {
    var dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }  
    var heap = Heap<Alpha>(type: .maxHeap)

    for (letter, count) in dict {
        heap.push(Alpha(letter: letter, count: count))
    }

    var result = [Character]()

    while heap.count > 1 {
        let first = heap.pop()!
        let second = heap.pop()!

        result.append(first.letter)
        result.append(second.letter)

        if first.count != 1 {
            heap.push(Alpha(letter: first.letter, count: first.count - 1))
        }

        if second.count != 1 {
            heap.push(Alpha(letter: second.letter, count: second.count - 1))
        }
    }

    if let first = heap.pop() {
        if first.count > 1 { return "" }

        result.append(first.letter)
    }

    return String(result)
}

print(reorganizeString("aab"))
print(reorganizeString("aaab"))