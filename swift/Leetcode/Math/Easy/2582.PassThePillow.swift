// For example, once the pillow reaches the nth person they 
// pass it to the n - 1th person, then to the n - 2th person and so on.
// Given the two positive integers n and time, 
// return the index of the person holding the pillow after time seconds.

// Time: O(1), Space: O(1)
func passThePillow(_ n: Int, _ time: Int) -> Int {
    let roundTrip = n * 2 - 2
    let remainder = time % roundTrip

    if remainder > n - 1 {
        return n - (remainder - n + 1)
    } else {
        return 1 + remainder
    }
}

print(passThePillow(4, 5))
print(passThePillow(3, 2))