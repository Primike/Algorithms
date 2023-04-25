# You are given an m x n integer matrix matrix with the following two properties:
# Each row is sorted in non-decreasing order.
# The first integer of each row is greater than the last integer of the previous row.
# Given an integer target, return true if target is in matrix or false otherwise.
# You must write a solution in O(log(m * n)) time complexity.

def searchMatrix(matrix, target):
    left, right = 0, len(matrix) - 1
    index = 0

    while left <= right:
        mid = (right + left)//2

        if target >= matrix[mid][0] and target <= matrix[mid][-1]:
            index = mid
            break
        elif target > matrix[mid][-1]:
            left = mid + 1
        else:
            right = mid - 1

    left, right = 0, len(matrix[index]) - 1

    while left <= right:
        mid = (right + left)//2

        if target == matrix[index][mid]:
            return True
        elif target > matrix[index][mid]:
            left = mid + 1
        else:
            right = mid - 1

    return False

print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3))
print(searchMatrix([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13))