def depthFirst(graph, source):
    print(source)
    for neighbor in graph[source]:
        depthFirst(graph, neighbor)

graph = {
    'a': ['b', 'c'],
    'b': ['d'],
    'c': ['e'],
    'd': ['f'],
    'e': [],
    'f': []
}

print(depthFirst(graph, 'a'))