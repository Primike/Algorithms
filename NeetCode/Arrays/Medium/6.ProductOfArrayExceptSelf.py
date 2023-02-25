def productExceptSelf(array):
    result = [1] * (len(array))
    prefix = 1

    for i in range(len(array)):
        result[i] = prefix
        prefix *= array[i]

    postfix = 1
    for i in range(len(array) - 1, -1, -1):
        result[i] *= postfix
        postfix *= array[i]

    return result

print(productExceptSelf([1,2,3,4]))
print(productExceptSelf([-1,1,0,-3,3]))