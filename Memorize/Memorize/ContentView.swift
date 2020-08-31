//
//  ContentView.swift
//  Memorize
//
//  Created by AMcom on 02/07/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
    var body: some View {
        
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
        .padding()
        }.padding()
            .foregroundColor(Color.orange)
    }
}

struct CardView: View {
    var card: MemoryGameModel<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: conerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadius)
                    .stroke( lineWidth: lineWidth)
                Text(card.content)
            } else {
                if !card.isMatched {
                RoundedRectangle(cornerRadius: conerRadius).fill()
                }
            }
        }.font(Font.system(size: fontSize(for: size)))
    }
    
    let conerRadius: CGFloat = 10
    let lineWidth: CGFloat = 3
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}












struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGameViewModel())
    }
}
