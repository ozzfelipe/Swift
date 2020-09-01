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
    
    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockWise: true)
                    .padding(5)
                    .opacity(0.3)
                Text(card.content).font(Font.system(size: fontSize(for: size)))
            }.cardify(isFaceUp: card.isFaceUp)
        }
        
    }
    
    private func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.65
    }
}















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        game.choose(card: game.cards[0])
        return ContentView(viewModel: game)
    }
}
