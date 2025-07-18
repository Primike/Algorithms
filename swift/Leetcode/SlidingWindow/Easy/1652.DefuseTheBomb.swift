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

// Time: O(n), Space: O(n)
func decrypt(_ code: [Int], _ k: Int) -> [Int] {
    if k == 0 { return Array(repeating: 0, count: code.count) }

    let numbers = abs(k)
    var result = Array(repeating: 0, count: code.count)
    var total = 0
    let range = k > 0 ? (0..<numbers) : ((code.count - numbers)..<code.count)

    for i in range {
        total += code[i]
    }

    if k > 0 {
        var index = numbers - 1

        for i in (0..<code.count).reversed() {
            result[i] = total
            total += code[i] - code[index]
            index = (index - 1 + code.count) % code.count
        }
    } else {
        var index = code.count - numbers

        for i in 0..<code.count {
            result[i] = total
            total += code[i] - code[index]
            index = (index + 1) % code.count
        }
    }

    return result
}

print(decrypt([5,7,1,4], 3))
print(decrypt([1,2,3,4], 0))
print(decrypt([2,4,9,3], -2))