// We want to select three indices i, j and k 
// where (0 <= i < j <= k < arr.length).
// Let's define a and b as follows:
// a = arr[i] ^ arr[i + 1] ^ ... ^ arr[j - 1]
// b = arr[j] ^ arr[j + 1] ^ ... ^ arr[k]
// Note that ^ denotes the bitwise-xor operation.
// Return the number of triplets (i, j and k) Where a == b.

func countTriplets(_ arr: [Int]) -> Int {
    var prefixXOR = Array(repeating: 0, count: arr.count + 1)
    
    for i in 0..<arr.count {
        prefixXOR[i + 1] = prefixXOR[i] ^ arr[i]
    }
    
    var count = 0
    
    for i in 0..<arr.count {
        for k in i+1..<arr.count {
            if prefixXOR[i] == prefixXOR[k + 1] { count += k - i }
        }
    }
    
    return count
}

print(countTriplets([2,3,1,6,7]))
print(countTriplets([1,1,1,1,1]))