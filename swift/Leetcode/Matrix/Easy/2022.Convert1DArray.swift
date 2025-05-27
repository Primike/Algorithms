// You are tasked with creating a 2-dimensional (2D) array with  
// m rows and n columns using all the elements from original.
// The elements from indices 0 to n - 1 (inclusive) of original 
// should form the first row of the constructed 2D array, 
// the elements from indices n to 2 * n - 1 (inclusive) 
// should form the second row of the constructed 2D array, and so on.
// Return an m x n 2D array constructed according to the above procedure, 
// or an empty 2D array if it is impossible.

// Time: O(n), Space: O(m * n)
func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
    if original.count != m * n { return [] }

    var result = Array(repeating: Array(repeating: 0, count: n), count: m)
    var index = 0

    for i in 0..<m {
        for j in 0..<n {
            result[i][j] = original[index]
            index += 1
        }
    }

    return result
}

print(construct2DArray([1,2,3,4], 2, 2))
print(construct2DArray([1,2,3], 1, 3))
print(construct2DArray([1,2], 1, 1))