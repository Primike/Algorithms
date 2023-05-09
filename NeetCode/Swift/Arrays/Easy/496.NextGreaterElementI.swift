//The next greater element of some element x in an array is the 
//first greater element that is to the right of x in the same array.

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let nums1Dict = nums1.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    var result = [Int](repeating: -1, count: nums1.count)
    var stack = [Int]()

    for number in nums2 {
        while let last = stack.last, number > last {
            let value = stack.removeLast()
            let index = nums1Dict[value]!
            result[index] = number
        }
        
        if nums1Dict.keys.contains(number) {
            stack.append(number)
        }
    }

    return result
}

print(nextGreaterElement([4,1,2], [1,3,4,2]))
print(nextGreaterElement([2,4], [1,2,3,4]))