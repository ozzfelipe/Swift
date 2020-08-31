//
//  Array+identifiable.swift
//  Memorize
//
//  Created by AMcom on 30/08/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }

}
