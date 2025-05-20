// You are given a 0-indexed integer array nums of size 3 
// which can form the sides of a triangle.
// A triangle is called equilateral if it has all sides of equal length.
// A triangle is called isosceles if it has exactly two sides of equal length.
// A triangle is called scalene if all its sides are of different lengths.
// Return a string representing the type of triangle that can be formed or 
// "none" if it cannot form a triangle.

// Time: O(1), Space: O(1)
func triangleType(_ nums: [Int]) -> String {
    if nums[0] == nums[1], nums[0] == nums[2] { return "equilateral" }

    let perimeter = nums.reduce(0, +)
    let largest = nums.max() ?? 0

    if largest >= perimeter - largest { return "none" }

    return Set(nums).count == 2 ? "isosceles" : "scalene"
}

print(triangleType([3,3,3]))
print(triangleType([3,4,5]))