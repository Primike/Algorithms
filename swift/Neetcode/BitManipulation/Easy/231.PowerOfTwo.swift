// Given an integer n, return true if it is a power of two. 
// Otherwise, return false. An integer n is a power of two, 
// if there exists an integer x such that n == 2x.

func isPowerOfTwo(_ n: Int) -> Bool {
    return n > 0 && (n & (n - 1)) == 0
}

print(isPowerOfTwo(1))
print(isPowerOfTwo(16))
print(isPowerOfTwo(3))