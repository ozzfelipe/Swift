//
//  MemoryGameModel.swift
//  Memorize
//
//  Created by AMcom on 05/07/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

struct MemoryGameModel<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnceAndOnlyFaceUpCard: Int? {
        get {cards.indices.filter {cards[$0].isFaceUp}.only}
        set {
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card choosen: \(card)")
        if let chosenIndex: Int = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOnceAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true

            } else {
                indexOfTheOnceAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
        
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let cardContent = cardContentFactory(pairIndex)
            cards.append(Card(content: cardContent, id: pairIndex*2))
            cards.append(Card(content: cardContent, id: pairIndex*2+1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
