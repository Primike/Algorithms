# Given an integer array nums and an integer k, 
# return the k most frequent elements. 
# You may return the answer in any order.

def topKFrequent(array, k):
    dictionary  = {}
    frequency = [[] for i in range(len(array) + 1)]

    for i in array:
        dictionary[i] = 1 + dictionary.get(i, 0)

    for i, j in dictionary.items():
        frequency[j].append(i)

    result = []
    for i in range(len(frequency) - 1, 0, -1):
        for j in frequency[i]:
            result.append(j)
            if len(result) == k:
                return result

print(topKFrequent([1,1,1,2,2,3], 2))
print(topKFrequent([1], 1))