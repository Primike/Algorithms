// You are given a list of airline tickets where tickets[i] = [fromi, toi] 
// represent the departure and the arrival airports of one flight. 
// Reconstruct the itinerary in order and return it.
// All of the tickets belong to a man who departs from "JFK", thus, 
// the itinerary must begin with "JFK". If there are multiple valid itineraries, 
// you should return the itinerary that has the smallest lexical order 
// when read as a single string.
// For example, the itinerary ["JFK", "LGA"] has a smaller 
// lexical order than ["JFK", "LGB"].

func findItinerary(_ tickets: [[String]]) -> [String] {
    var flights = [String: [String]]()
    var result = [String]()

    for ticket in tickets {
        flights[ticket[0], default: []].append(ticket[1])
    }

    flights.forEach { airport, _ in flights[airport]?.sort(by: >) }

    func dfs(_ airport: String) {
        while let nextDestination = flights[airport]?.popLast() {
            dfs(nextDestination)
        }

        result.append(airport)
    }

    dfs("JFK")
    return result.reversed()
}

print(findItinerary([
    ["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]))
print(findItinerary([
    ["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],
    ["ATL","JFK"],["ATL","SFO"]]))