// Given an array of distinct integers arr, find all pairs of 
// elements with the minimum absolute difference of any two elements.
// Return a list of pairs in ascending order(with respect to pairs), 
// each pair [a, b] follows
// a, b are from arr
// a < b
// b - a equals to the minimum absolute difference of any two elements in arr

// Time: O(n * log(n)), Space: O(n)
func minimumAbsDifference(_ arr: [Int]) -> [[Int]] {
    let arr = arr.sorted()
    var result = [[Int]]()
    var maximum = Int.max

    for i in 1..<arr.count {
        let difference = arr[i] - arr[i - 1]

        if difference < maximum {
            result = [[arr[i - 1], arr[i]]]
            maximum = difference
        } else if difference == maximum {
            result.append([arr[i - 1], arr[i]])
        }
    }

    return result
}

print(minimumAbsDifference([4,2,1,3]))
print(minimumAbsDifference([1,3,6,10,15]))
print(minimumAbsDifference([3,8,-10,23,19,-4,-14,27]))