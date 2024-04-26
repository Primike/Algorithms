// You can order the deck in any order you want. Initially, 
// all the cards start face down (unrevealed) in one deck.
// You will do the following steps repeatedly until all cards are revealed:
// Take the top card of the deck, reveal it, and take it out of the deck.
// If there are still cards in the deck then put the next 
// top card of the deck at the bottom of the deck.
// If there are still unrevealed cards, go back to step 1. Otherwise, stop.
// Return an ordering of the deck that would reveal the cards in increasing order.

func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
    let sortedDeck = deck.sorted()
    var queue = [Int]()
    
    for card in sortedDeck.reversed() {
        if let last = queue.last {
            queue.insert(last, at: 0)
            queue.removeLast()
        }

        queue.insert(card, at: 0)
    }
    
    return queue
}

print(deckRevealedIncreasing([17,13,11,2,3,5,7]))
print(deckRevealedIncreasing([1,1000]))