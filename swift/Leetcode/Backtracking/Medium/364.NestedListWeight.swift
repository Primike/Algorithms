class Solution {
    struct WeightedSumTriplet {
        let maxDepth: Int
        let sumOfElements: Int
        let sumOfProducts: Int
    }

    func depthSumInverse(_ nestedList: [NestedInteger]) -> Int {
        let triplet = getWeightedSumTriplet(nestedList, 1)
        return (triplet.maxDepth + 1) * triplet.sumOfElements - triplet.sumOfProducts
    }

    private func getWeightedSumTriplet(_ list: [NestedInteger], _ depth: Int) -> WeightedSumTriplet {
        var sumOfProducts = 0
        var sumOfElements = 0
        var maxDepth = 0

        for nested in list {
            if nested.isInteger() {
                let val = nested.getInteger()
                sumOfProducts += val * depth
                sumOfElements += val
                maxDepth = max(maxDepth, depth)
            } else {
                let result = getWeightedSumTriplet(nested.getList(), depth + 1)
                sumOfProducts += result.sumOfProducts
                sumOfElements += result.sumOfElements
                maxDepth = max(maxDepth, result.maxDepth)
            }
        }

        return WeightedSumTriplet(maxDepth: maxDepth, sumOfElements: sumOfElements, sumOfProducts: sumOfProducts)
    }
}