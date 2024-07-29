// You are given a 0-indexed binary string s and two integers minJump and maxJump. 
// In the beginning, you are standing at index 0, which is equal to '0'. 
// You can move from index i to index j if the following conditions are fulfilled:
// i + minJump <= j <= min(i + maxJump, s.length - 1), and s[j] == '0'.
// Return true if you can reach index s.length - 1 in s, or false otherwise.

// Time: O(n), Space: O(n)
func canReach(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
    let s = Array(s)
    var tab = Array(repeating: false, count: s.count)
    tab[0] = true
    var count = 0
    
    for i in min(minJump, s.count)..<s.count {            
        if tab[i - minJump] { count += 1 }
        if i > maxJump, tab[i - maxJump - 1] { count -= 1 }
        if s[i] == "0", count > 0 { tab[i] = true }
    }

    return tab[s.count - 1]
}

print(canReach("011010", 2, 3))
print(canReach("01101110", 2, 3))


// TLE
func canReach2(_ s: String, _ minJump: Int, _ maxJump: Int) -> Bool {
    if let last = s.last, last == "1" { return false }

    let s = Array(s)
    var visited = Set([0])
    var queue = [0]

    while !queue.isEmpty {
        let first = queue.removeFirst()

        for i in minJump...maxJump {
            let index = first + i

            if index >= s.count { break }
            if visited.contains(index) || s[index] == "1" { continue }
            if index == s.count - 1 { return true }

            queue.append(first + i) 
        }
    }

    return false
}