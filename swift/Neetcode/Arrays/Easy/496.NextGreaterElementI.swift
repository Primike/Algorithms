//The next greater element of some element x in an array is the 
//first greater element that is to the right of x in the same array.

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var dict = [Int: Int]()
    var stack = [Int]()

    for number in nums2 {
        while let last = stack.last, number > last {
            var last = stack.removeLast()
            dict[last] = number
        }

        stack.append(number)
    }

    var result = nums1

    for (i, number) in result.enumerated() {
        result[i] = dict[number] ?? -1
    }

    return result
}

print(nextGreaterElement([4,1,2], [1,3,4,2]))
print(nextGreaterElement([2,4], [1,2,3,4]))