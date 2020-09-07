//
//  View+Cardify.swift
//  Memorize
//
//  Created by AMcom on 01/09/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import SwiftUI

struct Cardify: AnimatableModifier {
    var rotation: Double
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var isFaceUp: Bool {
        rotation < 90
    }
    
    var animatableData: Double {
        get {return rotation}
        set {rotation = newValue}
    }
        
    func body(content: Content) -> some View {
        ZStack {
            Group{
                RoundedRectangle(cornerRadius: conerRadius)
                    .fill(Color.white)
                RoundedRectangle(cornerRadius: conerRadius)
                    .stroke( lineWidth: lineWidth)
                content
            }
                .opacity(isFaceUp ? 1 : 0)
            RoundedRectangle(cornerRadius: conerRadius).fill()
                .opacity(isFaceUp ? 0 : 1)

        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0,1,0))
    }
        
    private let conerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
    


