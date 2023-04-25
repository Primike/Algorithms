#Given an array nums of size n, return the majority element.

def majorityElement(nums):
    solution = None
    count = 0

    for number in nums:
        if count == 0:
            solution = number

        count += 1 if number == solution else -1

    return solution

print(majorityElement([3,2,3]))
print(majorityElement([2,2,1,1,1,2,2]))