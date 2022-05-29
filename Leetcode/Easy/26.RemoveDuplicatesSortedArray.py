# Given an integer array nums sorted in non-decreasing order, 
# remove the duplicates in-place such that each unique element appears only once. 
# The relative order of the elements should be kept the same.

def removeDuplicates(array):
    index = 1
    
    for i in range(len(array) - 1):
        if array[i + 1] == array[index - 1]:
            continue
        else:
            array[index] = array[i + 1]
            index = index + 1

    return array

print(removeDuplicates([1,1,2]))
print(removeDuplicates([0,0,0,1,1,1,2,2,3,3,4]))