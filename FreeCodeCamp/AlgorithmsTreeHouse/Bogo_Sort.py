import random

def is_sorrted(values):
    for index in range(len(values) - 1):
        if values[index] > values[index + 1]:
            return False
        
    return True

def bogo_sort(values):
    attempts = 0

    while not is_sorrted(values):
        random.shuffle(values)
        attempts += 1

    print(attempts)
    return values

print(bogo_sort([54,62,93,17,77,55,20]))