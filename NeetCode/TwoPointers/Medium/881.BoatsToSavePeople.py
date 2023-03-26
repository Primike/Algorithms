# You are given an array people where people[i] is the weight of the ith person, 
# and an infinite number of boats where each boat can carry a maximum weight of limit. 
# Each boat carries at most two people at the same time, 
# provided the sum of the weight of those people is at most limit.
# Return the minimum number of boats to carry every given person.

def numRescueBoats(people, limit):
    people.sort()
    left, right = 0, len(people) - 1
    count = 0

    while people[right] == limit:
        count += 1
        right -= 1

    while left < right:
        weight = people[left] + people[right]

        if weight > limit:
            count += 1
            right -= 1
        else:
            count += 1
            left, right = left + 1, right - 1


    return count + 1 if left == right else count

print(numRescueBoats([1,2], 3))
print(numRescueBoats([3,2,2,1], 3))
print(numRescueBoats([3,5,3,4], 5))