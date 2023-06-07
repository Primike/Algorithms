# Given the 2D array wall that contains the information about the wall, 
# return the minimum number of crossed bricks after drawing such a vertical line.

def leastBricks(wall):
    dict = {0 : 0}

    for row in wall:
        count = 0

        for brick in row[:-1]:
            count += brick

            dict[count] = dict.get(count, 0) + 1

    return len(wall) - max(dict.values())

print(leastBricks([[1,2,2,1],[3,1,2],[1,3,2],[2,4],[3,1,2],[1,3,1,1]]))
print(leastBricks([[1],[1],[1]]))