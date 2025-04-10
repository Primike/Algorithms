// Given a string s and an integer k, rearrange s such that the 
// same characters are at least distance k from each other. 
// If it is not possible to rearrange the string, return an empty string "".

// Time: O(n), Space: O(26)
func rearrangeString(_ s: String, _ k: Int) -> String {
    let s = Array(s).map { String($0) }
    let dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var maximum = dict.values.max() ?? 0
    var set1 = Set<String>()
    var set2 = Set<String>()

    for (key, value) in dict {
        if value == maximum { set1.insert(key) } 
        if value == maximum - 1 { set2.insert(key) }
    }
    
    var result = Array(repeating: "", count: maximum)

    for i in 0..<maximum {
        for letter in set1 {
            result[i] += letter
        }

        if i == maximum - 1 { break }

        for letter in set2 {
            result[i] += letter
        }
    }
    
    var index = 0

    for (key, value) in dict {
        if set1.contains(key) || set2.contains(key) { continue }

        var count = value

        while count > 0 {
            result[index] += key
            index = (index + 1) % (maximum - 1)
            count -= 1
        }
    }
    
    for i in 0..<(maximum - 1) {
        if result[i].count < k { return "" }
    }
    
    return result.joined()
}

print(rearrangeString("aabbcc", 3))
print(rearrangeString("aaabc", 3))
print(rearrangeString("aaadbbcc", 2))


struct Letter: Comparable {
    let letter: String
    var count: Int

    static func < (_ l: Letter, _ r: Letter) -> Bool {
        return l.count < r.count
    }
}

// Time: O(n * 26 * log(26)), Space: O(26)
func rearrangeString2(_ s: String, _ k: Int) -> String {
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