def fibonacciTab(n):
    table = [0]*(n+1)
    table[1] = 1

    for i in range(n):
        if i + 1 <= n:
            table[i + 1] += table[i]
        if i + 2 <= n:
            table[i + 2] += table[i]

    return table[n]

print(fibonacciTab(7))