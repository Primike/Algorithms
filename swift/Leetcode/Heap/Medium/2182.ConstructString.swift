// You are given a string s and an integer repeatLimit. 
// Construct a new string repeatLimitedString using the characters 
// of s such that no letter appears more than repeatLimit times in a row. 
// You do not have to use all characters from s.
// Return the lexicographically largest repeatLimitedString possible.

struct Letter: Comparable {
    let letter: String
    var count: Int

    static func < (_ l: Letter, _ r: Letter) -> Bool {
        return l.letter < r.letter
    }
}

// Time: O(n * log(26)), Space: O(26)
func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
    let s = Array(s).map { String($0) } 
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var heap = Heap<Letter>(.maxHeap)

    for (key, value) in dict {
        heap.push(Letter(letter: key, count: value))
    }    

    var result = ""

    while var first = heap.pop() {
        let count = min(first.count, repeatLimit)
        result += String(repeating: first.letter, count: count)

        if first.count > count, var next = heap.pop() {
            result += next.letter
            next.count -= 1

            if next.count > 0 { heap.push(next) }
            
            first.count -= count
            heap.push(first)
        }
    }

    return result
}

print(repeatLimitedString("cczazcc", 3))
print(repeatLimitedString("aababab", 2))