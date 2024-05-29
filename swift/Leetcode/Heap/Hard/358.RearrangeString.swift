// Given a string s and an integer k, rearrange s such that the 
// same characters are at least distance k from each other. 
// If it is not possible to rearrange the string, return an empty string "".

struct Letter: Comparable {
    let letter: Character
    var count: Int
    var time: Int

    static func < (_ l: Letter, _ r: Letter) -> Bool {
        return l.count < r.count
    }
}

// Time: O(n * 26 * log(26)), Space: O(26)
func rearrangeString(_ s: String, _ k: Int) -> String {
    if k == 0 { return s }
    
    let dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Letter>(.maxHeap)

    for (key, count) in dict {
        heap.push(Letter(letter: key, count: count, time: 0))
    }

    var result = ""
    var queue = [Letter]()
    var time = 0

    while !heap.isEmpty {
        var first = heap.pop()!
        result += String(first.letter)
        first.count -= 1 
        first.time = time + k

        time += 1 

        if first.count > 0 { queue.append(first) }
        if let first = queue.first, first.time == time { 
            queue.removeFirst()
            heap.push(first)
        }
    }

    if !queue.isEmpty { return "" }
    return result
}

print(rearrangeString("aabbcc", 3))
print(rearrangeString("aaabc", 3))
print(rearrangeString("aaadbbcc", 2))