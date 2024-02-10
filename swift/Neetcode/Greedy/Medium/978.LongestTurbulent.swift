// Given an integer array arr, return the length of a maximum size turbulent subarray of arr.

// Time: O(n), Space: O(1)
func maxTurbulenceSize(_ arr: [Int]) -> Int {
    var result = 1
    var count = 1
    var smaller = true

    for i in 1..<arr.count {
        if arr[i] == arr[i - 1] {
            count = 1
        } else if (smaller && arr[i] < arr[i - 1]) || (!smaller && arr[i] > arr[i - 1]) {
            count += 1
            smaller = !smaller
        } else {
            count = 2
            smaller = arr[i] > arr[i - 1]
        }

        result = max(result, count)
    }

    return result
}

print(maxTurbulenceSize([9,4,2,10,7,8,8,1,9]))
print(maxTurbulenceSize([4,8,12,16]))
print(maxTurbulenceSize([100]))