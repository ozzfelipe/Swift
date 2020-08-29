//
//  ResultViewController.swift
//  Swift Quiz
//
//  Created by AMcom on 24/02/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    
    @IBOutlet weak var lbAnsewred: UILabel!
    @IBOutlet weak var lbCorrect: UILabel!
    @IBOutlet weak var lbWrong: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    var totalCorrectAnswer: Int = 0
    var totalAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbAnsewred.text = "Perguntas Respondidas: \(totalAnswer)"
        lbCorrect.text = "Perguntas corretas: \(totalCorrectAnswer)"
        lbWrong.text = "Perguntas erradas: \(totalAnswer - totalCorrectAnswer)"
        let score = totalCorrectAnswer*100/totalAnswer
        lbScore.text = "\(score)%"
    }

    @IBAction func Close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
