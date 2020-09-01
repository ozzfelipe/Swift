//
//  View+Cardify.swift
//  Memorize
//
//  Created by AMcom on 01/09/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import SwiftUI

struct Cardify: ViewModifier {
    var isFaceUp: Bool
        
        func body(content: Content) -> some View {
            ZStack {
                if isFaceUp {
                    RoundedRectangle(cornerRadius: conerRadius)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: conerRadius)
                        .stroke( lineWidth: lineWidth)
                    content
                } else {
                    RoundedRectangle(cornerRadius: conerRadius).fill()
                }
            }
        }
        
    private let conerRadius: CGFloat = 10
    private let lineWidth: CGFloat = 3
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
    


