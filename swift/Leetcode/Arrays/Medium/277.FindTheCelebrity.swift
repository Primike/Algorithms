// Suppose you are at a party with n people labeled from 0 to n - 1 and among them, 
// there may exist one celebrity. The definition of a celebrity 
// is that all the other n - 1 people know the celebrity, 
// but the celebrity does not know any of them.
// You are given an integer n and a helper function bool knows(a, b) 
// that tells you whether a knows b. Implement a function int findCelebrity(n). 
// There will be exactly one celebrity if they are at the party.
// Return the celebrity's label if there is a celebrity at the party. 
// If there is no celebrity, return -1.

// Time: O(n), Space: O(1)
func findCelebrity(_ n: Int) -> Int {
    var result = 0

    for i in 1..<n {
        if knows(result, i) { result = i }
    }

    for i in 0..<n {
        if i == result { continue }
        if knows(result, i) || !knows(i, result) { return -1 }
    }

    return result
}