# Given an array of integers arr and two integers k and threshold, 
# return the number of sub-arrays of size k 
# and average greater than or equal to threshold.

def numOfSubarrays(arr, k, threshold):
    result = 0
    current_sum = sum(arr[:k - 1])
    
    for i in range(len(arr) - k + 1):
        current_sum += arr[i + k - 1]      

        if current_sum / k >= threshold:
            result += 1

        current_sum -= arr[i]

    return result 

print(numOfSubarrays([2,2,2,2,5,5,5,8], 3, 4))
print(numOfSubarrays([11,13,17,23,29,31,7,5,2,3], 3, 5))