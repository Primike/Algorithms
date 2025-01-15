// A prefix common array of A and B is an array C such that 
// C[i] is equal to the count of numbers that are present at 
// or before the index i in both A and B.
// Return the prefix common array of A and B.
// A sequence of n integers is called a permutation 
// if it contains all integers from 1 to n exactly once.

// Time: O(n), Space: O(n)
func findThePrefixCommonArray(_ A: [Int], _ B: [Int]) -> [Int] {
    var result = Array(repeating: 0, count: A.count)
    var numbersSet = Set<Int>()
    var count = 0

    for i in 0..<A.count {
        numbersSet.insert(A[i])
        numbersSet.insert(B[i])
        result[i] = 2 * (i + 1) - numbersSet.count
    }

    return result
}

print(findThePrefixCommonArray([1,3,2,4], [3,1,2,4]))
print(findThePrefixCommonArray([2,3,1], [3,1,2]))