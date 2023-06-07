# Given an array of integers temperatures represents the daily temperatures, 
# return an array answer such that answer[i] is 
# the number of days you have to wait after the ith day to get a warmer temperature. 
# If there is no future day for which this is possible, keep answer[i] == 0 instead.

def dailyTemperatures(temperatures):
    stack = []
    result = [0] * len(temperatures)

    for i, temp in enumerate(temperatures):
        while stack and temp > stack[-1][0]:
            last_temp, last_index = stack.pop()
            result[last_index] = (i - last_index)

        stack.append([temp, i])

    return result

print(dailyTemperatures([73,74,75,71,69,72,76,73]))
print(dailyTemperatures([30,40,50,60]))
print(dailyTemperatures([30,60,90]))