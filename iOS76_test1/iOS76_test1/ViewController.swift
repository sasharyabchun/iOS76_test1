//
//  ViewController.swift
//  iOS76_test1
//
//  Created by Alexandr on 16.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFiled: UITextField!
    @IBOutlet weak var secondNumberTextView: UITextView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var globalNumber: Int = 0
    private var allNumbers: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        globalNumber = defaults.integer(forKey: "Number")
        label.text = String(globalNumber)
        
        let allNumbersFromDefaults = defaults.string(forKey: "AllNumbers")
        if allNumbersFromDefaults != nil {
            allNumbers = allNumbersFromDefaults
        }
        historyTextView.text = allNumbers
    }

    @IBAction func megaButtonPressed(_ sender: UIButton) {
        print(textFiled.text!)
        if let number = Int(textFiled.text!), let secondNumber = Int(secondNumberTextView.text!) {
            globalNumber = number + secondNumber
            changeFontSize(fontSize: globalNumber)
            label.text = String(globalNumber)
            
            let defaults = UserDefaults.standard
            defaults.set(globalNumber, forKey: "Number")
            
            saveMultHistory(number: globalNumber)
            
        } else {
            label.text = "Invalid argument exception"
        }
    }
    
    private func changeFontSize(fontSize: Int) {
        secondNumberTextView.font = secondNumberTextView.font!.withSize(CGFloat(fontSize))
    }
    
    private func saveMultHistory(number: Int) {
        allNumbers += "\n" + String(number)
        
        let defaults = UserDefaults.standard
        defaults.set(allNumbers, forKey: "AllNumbers")
        
        historyTextView.text = allNumbers
    }
    
}

