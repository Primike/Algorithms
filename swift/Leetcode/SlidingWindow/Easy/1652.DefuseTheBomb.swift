// You have a bomb to defuse, and your time is running out! 
// Your informer will provide you with a circular array code of length of n and a key k.
// To decrypt the code, you must replace every number. 
// All the numbers are replaced simultaneously.
// If k > 0, replace the ith number with the sum of the next k numbers.
// If k < 0, replace the ith number with the sum of the previous k numbers.
// If k == 0, replace the ith number with 0.
// As code is circular, the next element of code[n-1] is code[0], 
// and the previous element of code[0] is code[n-1].
// Given the circular array code and an integer key k, 
// return the decrypted code to defuse the bomb!

func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    let n = code.count
    guard k != 0 else { return Array(repeating: 0, count: n) }

    var result = Array(repeating: 0, count: n)

    if k > 0 {
        for i in 0..<n {
            var sum = 0
            for j in 1...k {
                sum += code[(i + j) % n]
            }
            result[i] = sum
        }
    } else {
        for i in 0..<n {
            var sum = 0
            for j in 1...(-k) {
                sum += code[(i - j + n) % n]
            }
            result[i] = sum
        }
    }

    return result
}

print(decrypt([5,7,1,4], 3))
print(decrypt([1,2,3,4], 0))
print(decrypt([2,4,9,3], -2))