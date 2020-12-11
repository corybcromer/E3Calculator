//
//  DbvToVoltsViewController.swift
//  E3Calculator
//
//  Created by Cory Cromer on 5/9/19.
//  Copyright © 2019 BurningHearts. All rights reserved.
//

import UIKit
import SideMenu


class DbvToVoltsViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Creates ToolBar above Keyboard
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem:
            .flexibleSpace, target: nil, action: nil)//Adds space to the UIToolbar between "Clear" and "Calculate
        let calculateButton = UIBarButtonItem(title: "Calculate", style: .plain, target: self, action: #selector(self.calculateButtonPressed))//Adds "Calculate" Button to UIToolbar
        let clearButton = UIBarButtonItem(title: "Clear", style: .plain, target: self, action: #selector(self.clearButtonPressed))//Adds "Clear" Button to UIToolbar
        
        keyboardToolBar.setItems([clearButton, flexibleSpace, calculateButton], animated: true)//Orders the Buttons and Space in UIToolbar
        
        inputTextField.inputAccessoryView = keyboardToolBar
    }
    
    // Actions
    @objc func calculateButtonPressed() {
        print("Calculate Watts")
        calculateConversion()
    }
    
    @objc func clearButtonPressed() {
        print("Clear Button Pressed")
        return inputTextField.text = ""
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        //This action dismisses keyboard when background is tapped. Must first change view from UIView to UI Control and use "Touch Down" event.
        view.endEditing(true)
    }
    
    
    // Methods
    func calculateConversion() {
        
        guard let subtotal = Double(inputTextField.text!) else {
            print("Not a number!: \(inputTextField.text!)")
            outputLabel.text = "= Volts"
            return
        }
        
        print("The subtotal is \(subtotal)")
        
        // Coversion Logic
        let firstCalculation = (subtotal / 20)
        let total = pow(10,firstCalculation)
        print(total)
        let roundedTotal = Double(total).roundToPlaces(places: 8)
        
        return outputLabel.text = "= \(roundedTotal) V"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //This Function Causes UITextfield to automatically open when view is entered
        super.viewDidAppear(animated)
        
        DispatchQueue.main.async {
            self.inputTextField.becomeFirstResponder()
        }
    }
    
}
