def minAndRemove(array):
    min = array[0]
    minIndex = 0

    for i in range(len(array)):
        if array[i] < min:
            min = array[i]
            minIndex = i
    
    return array.pop(minIndex)

def selectionSort(array):
    sorted = []

    while len(array) != 0:
        sorted.append(minAndRemove(array))
        
    return sorted

print(selectionSort([3,4,51,4,5,2,77]))