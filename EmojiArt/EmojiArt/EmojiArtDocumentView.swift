//
//  EmojiArtDocumentView.swift
//  EmojiArt
//
//  Created by Felipe on 13/09/20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import SwiftUI

struct EmojiArtDocumentView: View {
    @ObservedObject var document: EmojiArtDocument
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(EmojiArtDocument.pallete.map{ String($0)}, id: \.self){ emoji in
                        Text(emoji)
                            .font(Font.system(size: CGFloat(25)))
                    }
                }
            }.padding(.horizontal)
            Rectangle().foregroundColor(Color.yellow)
                .edgesIgnoringSafeArea([.horizontal,.bottom])
        }
    }
}
