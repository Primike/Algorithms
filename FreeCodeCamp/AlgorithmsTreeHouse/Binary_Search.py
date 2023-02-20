#Many programing languages hold on to info about len(list) O(1)

def binary_search(list, target):
    first = 0
    last = len(list)

    while first <= last:
        midpoint = (last - first)//2

        if list[midpoint] == target:
            return midpoint
        elif list[midpoint] < target:
            first = midpoint + 1
        elif list[midpoint] > target:
            last = midpoint - 1

    return None
            
print(binary_search([1,2,3,4], 1))
#Swift allocates equal amounts of memory for elements(same type)
#Python adds a pointer since it is not strongly typed

#Space allocation for list is n + 1
#List resizing occurs at 0,4,8,16,25,35,46... elements
#Delete and append are O(n)
