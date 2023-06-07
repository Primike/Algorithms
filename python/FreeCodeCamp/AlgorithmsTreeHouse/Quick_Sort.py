def quick_sort(values):
    if len(values) <= 1:
        return values
    
    less_than_pivot = []
    greater_than_pivot = []
    pivot = values[0]

    for value in values[1:]:
        if value <= pivot:
            less_than_pivot.append(value)
        else:
            greater_than_pivot.append(value)

    return quick_sort(less_than_pivot) + [pivot] + quick_sort(greater_than_pivot)

print(quick_sort([54,62,93,17,77,55,20]
))