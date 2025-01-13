// You are given an integer array arr of length n that represents 
// a permutation of the integers in the range [0, n - 1].
// We split arr into some number of chunks (i.e., partitions), 
// and individually sort each chunk. After concatenating them, 
// the result should equal the sorted array.
// Return the largest number of chunks we can make to sort the array.

func maxChunksToSorted(_ arr: [Int]) -> Int {
    var result = 0
    var currentFarthest = arr[0]

    for i in 0..<arr.count {
        currentFarthest = max(currentFarthest, arr[i])

        if currentFarthest == i { result += 1 }
    }

    return result
}

print(maxChunksToSorted([4,3,2,1,0]))
print(maxChunksToSorted([1,0,2,3,4]))