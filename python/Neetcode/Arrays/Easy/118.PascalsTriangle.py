#Given an integer numRows, return the first numRows of Pascal's triangle.


def generate(numRows):
    result = [[1]]

    for i in range(numRows - 1):
        last_row = result[-1]
        new_row = []
        
        new_row.append(1)
        for j in range(i):
            new_row.append(last_row[j] + last_row[j + 1])
        new_row.append(1)

        result.append(new_row)

    return result

print(generate(5))
print(generate(1))