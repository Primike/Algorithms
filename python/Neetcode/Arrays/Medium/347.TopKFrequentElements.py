# Given an integer array nums and an integer k, 
# return the k most frequent elements. 
# You may return the answer in any order.

def topKFrequent(nums, k):
    count = {}
    frequency = [[] for i in range(len(nums) + 1)]

    for number in nums:
        count[number] = count.get(number, 0) + 1

    for key, value in count.items():
        frequency[value].append(key)

    result = []

    for i in range(len(frequency) - 1, -1, -1):
        for number in frequency[i]:
            result.append(number)

            if len(result) == k:
                return result

print(topKFrequent([1,1,1,2,2,3], 2))
print(topKFrequent([1], 1))