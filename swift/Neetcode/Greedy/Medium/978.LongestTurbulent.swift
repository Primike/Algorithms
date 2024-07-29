// Given an integer array arr, return the length of a maximum size turbulent subarray of arr.

// Time: O(n), Space: O(1)
func maxTurbulenceSize(_ arr: [Int]) -> Int {
    if arr.count == 1 { return 1 }
    
    var result = 1
    var isLarger = !(arr[1] > arr[0])
    var count = 1

    for i in 1..<arr.count {
        if isLarger, arr[i] < arr[i - 1] {
            count += 1
            isLarger = false
        } else if !isLarger, arr[i] > arr[i - 1] {
            count += 1
            isLarger = true
        } else {
            count = arr[i] == arr[i - 1] ? 1 : 2
            isLarger = arr[i] > arr[i - 1]
        }

        result = max(result, count)
    }

    return result
}

print(maxTurbulenceSize([9,4,2,10,7,8,8,1,9]))
print(maxTurbulenceSize([4,8,12,16]))
print(maxTurbulenceSize([100]))