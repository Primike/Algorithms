// We know that 4 and 7 are lucky digits. Also, 
// a number is called lucky if it contains only lucky digits.
// You are given an integer k, 
// return the kth lucky number represented as a string.

func kthLuckyNumber(_ k: Int) -> String {
    var k = k + 1 
    var result = ""

    while k > 1 {
        if k & 1 == 1 {
            result = "7" + result
        } else {
            result = "4" + result
        }
        
        k >>= 1
    }

    return result
}

print(kthLuckyNumber(4))
print(kthLuckyNumber(10))
print(kthLuckyNumber(1000))