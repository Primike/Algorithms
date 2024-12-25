// Given an array arr of integers, check if there exist 
// two indices i and j such that :
// i != j
// 0 <= i, j < arr.length
// arr[i] == 2 * arr[j]

// Time: O(n), Space: O(n)
func checkIfExist(_ arr: [Int]) -> Bool {
    var previous = Set<Int>()

    for number in arr {
        if previous.contains(number * 2) { return true }
        if number % 2 == 0, previous.contains(number / 2) { return true }
        
        previous.insert(number)
    }

    return false
}

print(checkIfExist([10,2,5,3]))
print(checkIfExist([3,1,7,11]))