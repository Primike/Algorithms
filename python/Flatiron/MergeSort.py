def findMinAndRemove(array1, array2):
    if array1[0] < array2[0]:
        return array1.pop(0)

    return array2.pop(0)

def merge(array1, array2):
    sorted = []
    currentMin = 0
    while len(array1) != 0 and len(array2) != 0:
        currentMin = findMinAndRemove(array1, array2)
        sorted.append(currentMin)

    return sorted + array1 + array2

def mergeSort(array):
    if len(array) < 2:
        return array
    
    return merge(mergeSort(array[0 : len(array)//2]), mergeSort(array[len(array)//2 : ]))

print(mergeSort([2,3,4,1,23,33,1]))








# def findMinAndRemove(array1, array2):
#     minArray1 = array1[0]
#     minArray2 = array2[0]
    
#     if minArray1 < minArray2:
#         x = array1[0]
#         array1.pop(0)
#         return x
#     else:
#         x = array2[0]
#         array2.pop(0)
#         return x

# def merge(array1, array2):
#     sorted = []
#     currentMin = 0
#     while len(array1) != 0 and len(array2) != 0:
#         currentMin = findMinAndRemove(array1, array2)
#         sorted.append(currentMin)

#     return sorted + array1 + array2

# def mergeSort(array):
#     midpoint = len(array)//2
#     array1 = array[0:midpoint]
#     array2 = array[midpoint: ]
#     if len(array) < 2:
#         return array
#     else:
#         merge(mergeSort(array1), mergeSort(array2))

# print(mergeSort([2,3,4,1,23,33]))