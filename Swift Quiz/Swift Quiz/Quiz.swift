//
//  Quiz.swift
//  Swift Quiz
//
//  Created by AMcom on 24/02/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import Foundation

class Quiz{
    let question: String
    let options: [String]
    private let correctedAnswer: String
    
    init(question: String, options:[String], correctedAnswer: String) {
        self.question = question
        self.options = options
        self.correctedAnswer = correctedAnswer
    }
    
    func validateQuestion(_ index: Int) -> Bool {
        let answer = options[index]
        return answer == correctedAnswer
    }
    
    deinit {
        print("Liberou recursos: Quiz")
    }
}
