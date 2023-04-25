# You are given an integer array height of length n. 
# There are n vertical lines drawn such that the two endpoints of the ith line 
# are (i, 0) and (i, height[i]).
# Return the maximum amount of water a container can store.

def maxArea(height):
    left, right = 0, len(height) - 1
    area = 0

    while left < right:
        current_area = min(height[left], height[right]) * (right - left)
        area = max(area, current_area)

        if height[left] < height[right]:
            left += 1
        else:
            right -= 1

    return area

print(maxArea([1,8,6,2,5,4,8,3,7]))
print(maxArea([1,1]))