# You are given an array prices where prices[i] 
# is the price of a given stock on the ith day.
# You want to maximize your profit by choosing a single day to buy one stock 
# and choosing a different day in the future to sell that stock.

def maxProfit(prices):

    left = 0
    max_profit = 0

    for i in range(1, len(prices)):
        if prices[i] > prices[left]:
            profit = prices[i] - prices[left]
            max_profit = max(profit, max_profit)
        else:
            left = i

    return max_profit

print(maxProfit([7,1,5,3,6,4]))
print(maxProfit([7,6,4,3,1]))
print(maxProfit([7,2,5,3,7,1,7,4]))