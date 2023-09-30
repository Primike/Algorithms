// Given a string s, rearrange the characters of s so that any 
// two adjacent characters are not the same.
// Return any possible rearrangement of s or return "" if not possible.

struct Alpha: Comparable {
    let alpha: Character
    let count: Int
    
    static func < (lhs: Alpha, rhs: Alpha) -> Bool {
        return lhs.count < rhs.count
    }
}

func reorganizeString(_ s: String) -> String {
    var dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var maxHeap = Heap<Alpha>(type: .maxHeap)

    for (key, value) in dict {
        maxHeap.push(Alpha(alpha: key, count: value))
    }

    var result = ""

    while maxHeap.size() > 1 {
        let first = maxHeap.pop()!
        let second = maxHeap.pop()!

        result += String(first.alpha)
        result += String(second.alpha)

        if first.count > 1 {
            maxHeap.push(Alpha(alpha: first.alpha, count: first.count - 1))
        }

        if second.count > 1 {
            maxHeap.push(Alpha(alpha: second.alpha, count: second.count - 1))
        }
    }

    if let last = maxHeap.pop() {
        if last.count > 1 { return "" }
        
        result += String(last.alpha)
    }

    return result
}

print(reorganizeString("aab"))
print(reorganizeString("aaab"))