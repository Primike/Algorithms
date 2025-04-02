// Given a string s and an integer k, rearrange s such that the 
// same characters are at least distance k from each other. 
// If it is not possible to rearrange the string, return an empty string "".

struct Letter: Comparable {
    let letter: String
    var count: Int

    static func < (_ l: Letter, _ r: Letter) -> Bool {
        return l.count < r.count
    }
}

// Time: O(n * 26 * log(26)), Space: O(26)
func rearrangeString(_ s: String, _ k: Int) -> String {
    let s = Array(s).map { String($0) }
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Letter>(.maxHeap)

    for (key, value) in dict {
        heap.push(Letter(letter: key, count: value))
    }

    var queue = [(Int, Letter)]()
    var result = ""
    var time = 0

    while !heap.isEmpty {
        var letter = heap.pop()!
        result += letter.letter
        letter.count -= 1
        time += 1

        if letter.count > 0 { queue.append((time + k - 1, letter)) }
        if !queue.isEmpty, queue[0].0 <= time { heap.push(queue.removeFirst().1) }
    }

    return result.count == s.count ? result : ""
}

print(rearrangeString("aabbcc", 3))
print(rearrangeString("aaabc", 3))
print(rearrangeString("aaadbbcc", 2))