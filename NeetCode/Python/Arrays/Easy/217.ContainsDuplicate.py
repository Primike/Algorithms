# Given an integer nums nums, 
# return true if any value appears at least twice in the nums, 
# and return false if every element is distinct.

def containsDuplicate(nums):
    hash_set = set()

    for number in nums:
        if number in hash_set:
            return True

        hash_set.add(number)
        
    return False

print(containsDuplicate([1,2,3,4]))
print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
