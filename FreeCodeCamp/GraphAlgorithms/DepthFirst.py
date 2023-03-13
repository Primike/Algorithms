def depthFirst(graph, source):
    stack = [source]

    while len(stack) > 0:
        current = stack.pop()
        print(current)

        for neighbor in graph[current]:
            stack.append(neighbor)


def depthFirstRecursion(graph, source):
    print(source)
    for neighbor in graph[source]:
        depthFirstRecursion(graph, neighbor)


graph = {
    'a': ['b', 'c'],
    'b': ['d'],
    'c': ['e'],
    'd': ['f'],
    'e': [],
    'f': []
}
#///
print(depthFirst(graph, 'a'))
print(depthFirstRecursion(graph, 'a'))