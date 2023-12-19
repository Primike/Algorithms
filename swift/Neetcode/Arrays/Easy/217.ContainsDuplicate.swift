// Given an integer nums nums, 
// return true if any value appears at least twice in the nums, 
// and return false if every element is distinct.

func containsDuplicate(_ nums: [Int]) -> Bool {
    var hashSet = Set<Int>()

    for number in nums {
        if hashSet.contains(number) { return true }
        hashSet.insert(number)
    }

    return false
}

print(containsDuplicate([1,2,3,4]))
print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
