def largestNumber(nums):
    integer = 9
    array = []
    result = ""

    while integer != 0 or len(array) != len(nums):
        for number in nums:
            if str(number).startswith(str(integer)):
                array.append(number)

        array.sort()
        result += ''.join(str(array) for number in array)
        array = []
        integer -= 1

    return result

print(largestNumber([21,9]))