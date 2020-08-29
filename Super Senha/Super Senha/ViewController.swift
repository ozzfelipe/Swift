//
//  ViewController.swift
//  Super Senha
//
//  Created by AMcom on 01/03/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfTotalPasswords: UITextField!
    @IBOutlet weak var tfTotalCaracters: UITextField!
    @IBOutlet weak var swLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swCapitalLetters: UISwitch!
    @IBOutlet weak var swCaractersEspecial: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let passwordViewController = segue.destination as! PasswordsViewController
        if let numberOfPasswords = Int(tfTotalPasswords.text!) {
            passwordViewController.numberOfPasswords = numberOfPasswords
        }
        if let numberOfCaracters = Int(tfTotalCaracters.text!) {
            passwordViewController.numberOfCaracters = numberOfCaracters
        }
        passwordViewController.useSpecialCaracters = swCaractersEspecial.isOn
        passwordViewController.useCapitalLetters = swCapitalLetters.isOn
        passwordViewController.useNumbers = swNumbers.isOn
        passwordViewController.useLetters = swLetters.isOn
        view.endEditing(true)
    }


}

