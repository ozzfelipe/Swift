//
//  EmojiMemoryGameViewModel.swift
//  Memorize
//
//  Created by AMcom on 05/07/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import SwiftUI

class EmojiMemoryGameViewModel: ObservableObject {
    @Published private(set) var model: MemoryGameModel<String> = EmojiMemoryGameViewModel.createMemoryGame()
        
        
    static func createMemoryGame() -> MemoryGameModel<String> {
        let emojis = ["👻","🎃","🕷"]
        return MemoryGameModel(numberOfPairsOfCards: emojis.count) {pairIndex in
            return emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGameModel<String>.Card> {
        model.cards
    }
    
    func choose(card: MemoryGameModel<String>.Card){
        model.choose(card: card)
    }
}
