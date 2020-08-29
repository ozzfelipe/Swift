//
//  QuizViewController.swift
//  Swift Quiz
//
//  Created by AMcom on 24/02/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var viTimer: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet var btAnswers: [UIButton]!
    
    let quizManager = QuizManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viTimer.frame.size.width = view.frame.size.width
        UIView.animate(withDuration: 60, delay: 0, options: .curveLinear, animations: {
            self.viTimer.frame.size.width = 0
        }) { (sucsses) in
            self.showResults()
        }
        
        self.getNewQuiz()
    }
    
    func getNewQuiz(){
        quizManager.refreshQuiz()
        lbQuestion.text = quizManager.question
        for i in 0..<quizManager.options.count {
            let option = quizManager.options[i]
            let button = btAnswers[i]
            
            button.setTitle(option, for: .normal)
        }
    }
    
    func showResults(){
        performSegue(withIdentifier: "resultSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.totalAnswer = quizManager.totalAnswers
        resultViewController.totalCorrectAnswer = quizManager.totalCorrectAnswears
    }

    @IBAction func selectAnswer(_ sender: UIButton) {
        let index = btAnswers.firstIndex(of: sender)!
        
        quizManager.validateAnswear(index: index)
        
        getNewQuiz()
        
    }
}
