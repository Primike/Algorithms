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


print(merge([2,3,4], [1,23,33]))
