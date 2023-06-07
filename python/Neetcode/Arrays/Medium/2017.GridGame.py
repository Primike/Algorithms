# You are given a 0-indexed 2D array grid of size 2 x n, 
# Two robots are playing a game on this matrix.
# The first robot wants to minimize the number of points collected by the second robot. 
# In contrast, the second robot wants to maximize the number of points it collects. 
# If both robots play optimally, return the number of points collected by the second robot.

def gridGame(grid):
    n = len(grid[0])
    prefix_1, prefix_2 = grid[0], grid[1]

    for i in range(1, n):
        prefix_1[i] += prefix_1[i - 1]
        prefix_2[i] += prefix_2[i - 1]

    result = float('inf')

    for i in range(n):
        top = prefix_1[-1] - prefix_1[i]
        bottom = prefix_2[i - 1] if i > 0 else 0
        second_robot = max(top, bottom)
        result = min(result, second_robot)

    return result

print(gridGame([[2,5,4],[1,5,1]]))
print(gridGame([[3,3,1],[8,5,2]]))
print(gridGame([[1,3,1,15],[1,3,3,1]]))