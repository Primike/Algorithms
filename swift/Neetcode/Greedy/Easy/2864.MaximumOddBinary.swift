// You are given a binary string s that contains at least one '1'.
// You have to rearrange the bits in such a way that the resulting 
// binary number is the maximum odd binary number that can be 
// created from this combination.
// Return a string representing the maximum odd binary number 
// that can be created from the given combination.

func maximumOddBinaryNumber(_ s: String) -> String {
    let ones = s.filter { $0 == "1" }.count - 1 
    let zeros = s.filter { $0 == "0" }.count   

    return String(repeating: "1", count: ones) + String(repeating: "0", count: zeros) + "1"
}

print(maximumOddBinaryNumber("010"))
print(maximumOddBinaryNumber("0101"))