# Given an integer array nums, 
# return true if any value appears at least twice in the array, 
# and return false if every element is distinct.

def containsDuplicate(array):
    x = {}

    for i in array:
        if x.get(i) == None:
            x[i] = 1
        else:
            return True

    return False

print(containsDuplicate([1,2,3,4,5,6,7,8]))
print(containsDuplicate([1,1,1,3,3,4,3,2,4,2]))
