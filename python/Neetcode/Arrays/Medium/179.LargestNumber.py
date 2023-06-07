# Given a list of non-negative integers nums, 
# arrange them such that they form the largest number and return it.
# Since the result may be very large, so you need to return a string instead of an integer.


def largestNumber(nums):
    for i, number in enumerate(nums):
        nums[i] = str(number)

    def compare(n1, n2):
        if n1+ n2 > n2 + n1:
            return -1
        else:
            return 1
        
    nums = sorted(nums, key=cmp_to_key(compare))

    return str(int("".join(nums)))

print(largestNumber([21,9]))