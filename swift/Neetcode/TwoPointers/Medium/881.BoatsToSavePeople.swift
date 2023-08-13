//You are given an array people where people[i] is the weight of the ith person, 
//and an infinite number of boats where each boat can carry a maximum weight of limit. 
//Each boat carries at most two people at the same time, 
//provided the sum of the weight of those people is at most limit.
//Return the minimum number of boats to carry every given person.

func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
    var people = people.sorted()
    var left = 0, right = people.count - 1
    var boats = 0

    while left <= right {
        if people[left] + people[right] <= limit { left += 1 } 

        right -= 1
        boats += 1
    }

    return boats
}

print(numRescueBoats([1,2], 3))
print(numRescueBoats([3,2,2,1], 3))
print(numRescueBoats([3,5,3,4], 5))