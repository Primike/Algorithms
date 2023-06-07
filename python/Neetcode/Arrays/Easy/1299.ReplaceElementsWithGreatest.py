#Given an array arr, replace every element in that array 
#with the greatest element among the elements to its right, 
#and replace the last element with -1.

def replaceElements(arr):
    maximum = -1

    for number in range(len(arr) - 1, -1, -1):
        old_max = maximum

        if arr[number] > old_max:
            maximum = arr[number]

        arr[number] = old_max

    return arr

print(replaceElements([17,18,5,4,6,1]))
print(replaceElements([400]))