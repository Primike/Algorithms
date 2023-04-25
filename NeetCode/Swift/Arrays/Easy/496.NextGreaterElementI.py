# The next greater element of some element x in an array is the 
# first greater element that is to the right of x in the same array.

def nextGreaterElement(nums1, nums2):

    nums1_dict = {number: index for index, number in enumerate(nums1)}
    result = [-1] * len(nums1)

    stack = []

    for number in nums2:
        print(1,result)
        while stack and number > stack[-1]:
            value = stack.pop()
            index = nums1_dict[value]
            result[index] = number
        if number in nums1_dict:
            stack.append(number)

    return result

print(nextGreaterElement([4,1,2], [1,3,4,2]))
print(nextGreaterElement([2,4], [1,2,3,4]))