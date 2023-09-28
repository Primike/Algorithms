// Given an integer array arr, return the length of a maximum size turbulent subarray of arr.

func maxTurbulenceSize(_ arr: [Int]) -> Int {
    var left = 0, right = 1
    var result = 1
    var sign = ""

    while right < arr.count {
        if arr[right - 1] > arr[right], sign != ">" {
            result = max(result, right - left + 1)
            right += 1
            sign = ">"
        } else if arr[right - 1] < arr[right], sign != "<" {
            result = max(result, right - left + 1)
            right += 1
            sign = "<"
        } else {
            right = arr[right] == arr[right - 1] ? right + 1 : right
            left = right - 1
            sign = ""
        }
    }

    return result
}

print(maxTurbulenceSize([9,4,2,10,7,8,8,1,9]))
print(maxTurbulenceSize([4,8,12,16]))
print(maxTurbulenceSize([100]))