// Given a target representing the value of the wheels that will unlock the lock, 
// return the minimum total number of turns required to open the lock, or -1 if it is impossible.

func openLock(_ deadends: [String], _ target: String) -> Int {
    if deadends.contains("0000") { return -1 }

    func combinations(_ current: String) -> [String] {
        var result = [String]()
        var current = Array(current).map { Int(String($0))! }

        for i in 0..<4 {
            let digit = current[i]
            
            current[i] = (digit + 1) % 10
            result.append(current.map { String($0) }.joined())
            
            current[i] = (digit + 9) % 10
            result.append(current.map { String($0) }.joined())
            
            current[i] = digit 
        }
        
        return result
    }

    var queue = [(String, Int)]()
    var visited = Set(deadends)
    queue.append(("0000", 0))

    while !queue.isEmpty {
        let (current, turns) = queue.removeFirst()
        if current == target { return turns }

        for combination in combinations(current) {
            if !visited.contains(combination) {
                visited.insert(combination)
                queue.append((combination, turns + 1))
            }
        }
    }

    return -1
}

print(openLock(["0201","0101","0102","1212","2002"], "0202"))
print(openLock(["8888"], "0009"))
print(openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888"))