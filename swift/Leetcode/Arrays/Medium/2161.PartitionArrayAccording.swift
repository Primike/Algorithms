// Every element less than pivot appears 
// before every element greater than pivot.
// Every element equal to pivot appears in between the elements 
// less than and greater than pivot.
// The relative order of the elements less than pivot 
// and the elements greater than pivot is maintained.
// Return nums after the rearrangement.

// Time: O(n), Space: O(n)
func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
    var lessThan = [Int]()
    var greaterThan = [Int]()
    var count = 0

    for number in nums {
        if number < pivot {
            lessThan.append(number)
        } else if number > pivot {
            greaterThan.append(number)
        } else {
            count += 1
        }
    }

    return lessThan + Array(repeating: pivot, count: count) + greaterThan
}

print(pivotArray([9,12,5,10,14,3,10], 10))
print(pivotArray([-3,4,3,2], 2))