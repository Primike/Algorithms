class NumberContainers {
    var numberToIndices: [Int: [Int]] = [:]
    var indexToNumber: [Int: Int] = [:]

    func change(_ index: Int, _ number: Int) {
        if let prev = indexToNumber[index] {
            if var arr = numberToIndices[prev], let pos = arr.firstIndex(of: index) {
                arr.remove(at: pos)
                numberToIndices[prev] = arr.isEmpty ? nil : arr
            }
        }
        indexToNumber[index] = number
        if var arr = numberToIndices[number] {
            let pos = insertionIndex(of: index, in: arr)
            arr.insert(index, at: pos)
            numberToIndices[number] = arr
        } else {
            numberToIndices[number] = [index]
        }
    }

    func find(_ number: Int) -> Int {
        if let arr = numberToIndices[number], !arr.isEmpty {
            return arr[0]
        }
        return -1
    }
    
    func insertionIndex(of element: Int, in arr: [Int]) -> Int {
        var low = 0
        var high = arr.count
        while low < high {
            let mid = (low + high) / 2
            if arr[mid] < element {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}