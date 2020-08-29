//
//  PasswordGenerator.swift
//  Super Senha
//
//  Created by AMcom on 03/03/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

class PasswordGenerator {
    var numberOfCaracters: Int
    var numberOfPasswords: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLetters: Bool
    var useSpecialCaracters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCaracters = "!@#$%ˆ&*()_-+='`˜?/."
    private let numbers = "1234567890"
    
    init(numberOfCaracters: Int, numberOfPasswords: Int, useLetters: Bool ,useNumbers: Bool ,useCapitalLetters: Bool ,useSpecialCaracters: Bool) {
        
        var numchars = min(numberOfCaracters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfCaracters = numchars
        self.numberOfPasswords = numberOfPasswords
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCaracters = useSpecialCaracters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useSpecialCaracters {
            universe += specialCaracters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        if useNumbers {
            universe += numbers
        }
        
        let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCaracters {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
    
    
}
