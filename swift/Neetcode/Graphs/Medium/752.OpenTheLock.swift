// Given a target representing the value of the wheels that will unlock the lock, 
// return the minimum total number of turns required to open the lock, or -1 if it is impossible.

// Time: 10^4, Space: 10^4
func openLock(_ deadends: [String], _ target: String) -> Int {
    if deadends.contains("0000") { return -1 }

    var deadends = Set(deadends)
    deadends.insert("0000")
    var queue = ["0000"]
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            if first == target { return result }

            let array = first.map { Int(String($0))! }

            for i in 0..<4 {
                var forward = array
                var backward = array

                forward[i] += 1
                if forward[i] == 10 { forward[i] = 0 }

                backward[i] -= 1
                if backward[i] == -1 { backward[i] = 9 }

                let string1 = forward.map { String($0) }.joined()
                let string2 = backward.map { String($0) }.joined()

                if !deadends.contains(string1) {
                    queue.append(string1)
                    deadends.insert(string1)
                }

                if !deadends.contains(string2) {
                    queue.append(string2)
                    deadends.insert(string2)
                }
            }
        }

        result += 1
    }

    return -1
}


print(openLock(["0201","0101","0102","1212","2002"], "0202"))
print(openLock(["8888"], "0009"))
print(openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888"))