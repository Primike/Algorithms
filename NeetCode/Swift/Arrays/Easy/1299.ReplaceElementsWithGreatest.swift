//Given an array arr, replace every element in that array 
//with the greatest element among the elements to its right, 
//and replace the last element with -1.

func replaceElements(_ arr: [Int]) -> [Int] {
    var arr = arr
    var greatest = -1
    
    for i in stride(from: arr.count - 1, to: -1, by: -1) {
        var current = arr[i]
        arr[i] = greatest
        greatest = max(greatest, current)
    }

    return arr
}

print(replaceElements([17,18,5,4,6,1]))
print(replaceElements([400]))