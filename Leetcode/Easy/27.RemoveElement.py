# Given an integer array nums and an integer val, 
# remove all occurrences of val in nums in-place. 
# The relative order of the elements may be changed.

def removeElement(array, x):
    if len(array) == 1 and array[0] == x:
        return 0

    index = None

    for i in range(len(array)):
        if array[i] == x and index == None:
            index = i
        elif array[i] != x and index != None:
            array[index] = array[i]
            index += 1

    return array

print(removeElement([2,2,2,2,3,0,4,2], 2))
print(removeElement([1,2], 1))
print(removeElement([3,2,2,3], 3))