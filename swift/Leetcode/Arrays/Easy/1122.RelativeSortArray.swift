// Given two arrays arr1 and arr2, the elements of arr2 are distinct, 
// and all elements in arr2 are also in arr1.
// Sort the elements of arr1 such that the relative ordering of items 
// in arr1 are the same as in arr2. Elements that do not appear in 
// arr2 should be placed at the end of arr1 in ascending order.

// Time: O(n * logn), Space: O(n)
func relativeSortArray(_ arr1: [Int], _ arr2: [Int]) -> [Int] {
    var dict = arr1.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()

    for number in arr2 {
        if let count = dict[number] {
            result += Array(repeating: number, count: count)
            dict[number] = nil
        }
    }

    let extras = dict.map { ($0.key, $0.value) }.sorted { $0.0 < $1.0 }

    for (number, count) in extras {
        result += Array(repeating: number, count: count)
    }

    return result
}

print(relativeSortArray([2,3,1,3,2,4,6,7,9,2,19], [2,1,4,3,9,6]))
print(relativeSortArray([28,6,22,8,44,17], [22,28,8,6]))