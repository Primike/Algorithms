// In the town of Digitville, there was a list of numbers 
// called nums containing integers from 0 to n - 1. 
// Each number was supposed to appear exactly once in the list, 
// however, two mischievous numbers sneaked in an additional time, 
// making the list longer than usual.
// As the town detective, your task is to find these 
// two sneaky numbers. Return an array of size two containing 
// the two numbers (in any order), so peace can return to Digitville.

// Time: O(n), Space: O(n)
func getSneakyNumbers(_ nums: [Int]) -> [Int] {
    var numberSet = Set<Int>()
    var result = [Int]()

    for number in nums {
        if numberSet.contains(number) { result.append(number) }
        numberSet.insert(number)
    }

    return result
}

print(getSneakyNumbers([0,1,1,0]))
print(getSneakyNumbers([0,3,2,1,3,2]))
print(getSneakyNumbers([7,1,5,4,3,4,6,0,9,5,8,2]))