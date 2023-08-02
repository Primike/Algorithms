// There is a function signFunc(x) that returns:
// 1 if x is positive.
// -1 if x is negative.
// 0 if x is equal to 0.
// You are given an integer array nums. 
// Let product be the product of all values in the array nums.

func arraySign(_ nums: [Int]) -> Int {
    return nums.reduce(1) { $0 * ($1 == 0 ? 0 : $1 / abs($1)) }
}

print(arraySign([-1,-2,-3,-4,3,2,1]))
print(arraySign([1,5,0,2,-3]))