//
//  EmojiArtDocument.swift
//  EmojiArt
//
//  Created by Locação on 14/09/20.
//  Copyright © 2020 Felipe. All rights reserved.
//

import SwiftUI

class EmojiArtDocument: ObservableObject {
    static var pallete: String = "🍏🍋🍌🍉🍇🍓🍈🥭🍍🥥"
    
    @Published private var emojiArt: EmojiArtModel = EmojiArtModel()
    
    // MARK: - Intent(s)
    
    func addEmoji(_ emoji: String, at location: CGPoint, size: CGFloat) {
        emojiArt.addEmoji(emoji, x: Int(location.x), y: Int(location.y), size: Int(size))
    }
    
    func moveEmoji(_ emoji: EmojiArtModel.Emoji, by offset: CGSize) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].x += Int(offset.width)
            emojiArt.emojis[index].y += Int(offset.height)
        }
    }
    
    func scaleEmoji(_ emoji: EmojiArtModel.Emoji, by scale: CGFloat) {
        if let index = emojiArt.emojis.firstIndex(matching: emoji) {
            emojiArt.emojis[index].size = Int((CGFloat(emojiArt.emojis[index].size) * scale).rounded(.toNearestOrEven))
        }
    }

}
