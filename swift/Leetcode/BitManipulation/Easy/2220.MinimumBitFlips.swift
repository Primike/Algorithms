// A bit flip of a number x is choosing a bit in the 
// binary representation of x and flipping it from either 0 to 1 or 1 to 0.
// For example, for x = 7, the binary representation is 111 and 
// we may choose any bit (including any leading zeros not shown) and flip it. 
// We can flip the first bit from the right to get 110, flip the 
// second bit from the right to get 101, flip the fifth bit from the right 
// (a leading zero) to get 10111, etc.
// Given two integers start and goal, return the minimum number of 
// bit flips to convert start to goal.

func minBitFlips(_ start: Int, _ goal: Int) -> Int {
    var xorResult = start ^ goal
    var count = 0

    while xorResult > 0 {
        count += xorResult & 1 
        xorResult >>= 1 
    }

    return count
}

print(minBitFlips(10, 7))
print(minBitFlips(3, 4))