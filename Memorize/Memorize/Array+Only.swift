//
//  Array+Only.swift
//  Memorize
//
//  Created by AMcom on 31/08/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
