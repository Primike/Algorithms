// Given a target representing the value of the wheels that will unlock the lock, 
// return the minimum total number of turns required to open the lock, or -1 if it is impossible.

// Time: O(10^4), Space: O(10^4)
func openLock(_ deadends: [String], _ target: String) -> Int {
    if deadends.contains("0000") { return -1 }
    
    var deadends = Set(deadends.map { $0.map { Int(String($0)) ?? 0 } })
    let target = target.map { Int(String($0)) ?? 0 }
    var queue = [[0,0,0,0]]
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()
            if first == target { return result }

            for i in 0..<4 {
                var forward = first, backward = first
                forward[i] = (forward[i] + 1) % 10
                backward[i] = (backward[i] - 1 + 10) % 10

                if !deadends.contains(forward) {
                    deadends.insert(forward)
                    queue.append(forward)
                }

                if !deadends.contains(backward) {
                    deadends.insert(backward)
                    queue.append(backward)
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