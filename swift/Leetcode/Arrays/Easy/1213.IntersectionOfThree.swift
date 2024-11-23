// Given three integer arrays arr1, arr2 and arr3 sorted in 
// strictly increasing order, return a sorted array of 
// only the integers that appeared in all three arrays.

// Time: O(n), Space: O(n)
func arraysIntersection(_ arr1: [Int], _ arr2: [Int], _ arr3: [Int]) -> [Int] {
    var dict = [Int: Int]()

    for number in Set(arr1) {
        dict[number, default: 0] += 1
    }

    for number in Set(arr2) {
        dict[number, default: 0] += 1
    }

    for number in Set(arr3) { 
        dict[number, default: 0] += 1
    }

    var result = [Int]()

    for (key, value) in dict {
        if value == 3 { result.append(key) }
    }

    return result.sorted()
}

print(arraysIntersection([1,2,3,4,5], [1,2,5,7,9], [1,3,4,5,8]))
print(arraysIntersection([197,418,523,876,1356], [501,880,1593,1710,1870], [521,682,1337,1395,1764]))