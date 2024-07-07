// For example, once the pillow reaches the nth person they 
// pass it to the n - 1th person, then to the n - 2th person and so on.
// Given the two positive integers n and time, 
// return the index of the person holding the pillow after time seconds.

// Time: O(1), Space: O(1)
func passThePillow(_ n: Int, _ time: Int) -> Int {
    let rounds = time / (n - 1)
    let moves = time % (n - 1)

    return rounds % 2 == 0 ? moves + 1 : n - moves
}

print(passThePillow(4, 5))
print(passThePillow(3, 2))