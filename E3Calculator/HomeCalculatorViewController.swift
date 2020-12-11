//
//  HomeCalculatorViewController.swift
//  E3Calculator
//
//  Created by Cory Cromer on 5/19/19.
//  Copyright © 2019 BurningHearts. All rights reserved.
//

import UIKit
import SideMenu

class HomeCalculatorViewController: UIViewController, UITextFieldDelegate {
    
    var currentNumberInLabel: Double = 0
    var firstNumberInLabel: Double = 0
    var secondNumberInLabel: Double = 0
    var total: Double = 0
    var firstOperation: Double = 0
    var secondOperation: Double = 0
    var isPerformingOperation = false
    var isCalculating = false
    var isCalculatingTwo = false
    var hasEqualsBeenPressed = false
    
    //Outlets
    @IBOutlet weak var calculatorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        calculatorLabel.text = "0"
    }
    
    //Actions
    @IBAction func numberPressed(_ sender: Any) {
        if isPerformingOperation == true {
            isPerformingOperation = false
            
            //A if statement to test whether default number is Zero is nested in if statement to test whether operation is being performed
            if calculatorLabel.text == "0" || hasEqualsBeenPressed == true {
                calculatorLabel.text = String((sender as AnyObject).tag)
            } else {
                calculatorLabel.text = String((sender as AnyObject).tag)
            }
            
            
        } else if calculatorLabel.text == "0" || hasEqualsBeenPressed == true {
            calculatorLabel.text = String((sender as AnyObject).tag)
            } else if let calculatorLabelText = calculatorLabel.text {
                calculatorLabel.text = calculatorLabelText + String((sender as AnyObject).tag)
            }
        
        currentNumberInLabel = Double(calculatorLabel.text!)!
    }
    
    @IBAction func decimalPressed(_ sender: Any) {
        if isPerformingOperation == true {
            isPerformingOperation = false
            calculatorLabel.text = "."
        
        } else if calculatorLabel.text!.contains(".") {
            } else {
            if let calculatorLabelText = calculatorLabel.text {
                calculatorLabel.text = calculatorLabelText + "."
                }
            }
        }
    
    @IBAction func percentagePressed(_ sender: Any) {
        if let calculatorLabelText = calculatorLabel.text {
            calculatorLabel.text = String(Double(calculatorLabelText)! * 0.01)
        }
       currentNumberInLabel = Double(calculatorLabel.text!)!
    }
    
    @IBAction func positiveNegativePressed(_ sender: Any) {
        let numberConverted = Double(calculatorLabel.text!)!
        
        if numberConverted > 0 {
            calculatorLabel.text = String(0 - numberConverted)
        }
        else if numberConverted < 0
        {
            // Since number is negative, lets try to
            // minus minus the number and make it positive.
            calculatorLabel.text = String(0 - numberConverted)
        }
        currentNumberInLabel = Double(calculatorLabel.text!)!
    }
    
    @IBAction func operatorPressed(_ sender: UIButton) {
        
        //Clear Button (Tag 18)
        if sender.tag == 18 {
            calculatorLabel.text = "0"
            currentNumberInLabel = 0
            firstNumberInLabel = 0
            secondNumberInLabel = 0
            firstOperation = 0
            secondOperation = 0
            isCalculating = false
            isCalculatingTwo = false
            hasEqualsBeenPressed = false
            
            return
        }
        
        
        //Math Operators
        if (sender.tag == 12 || sender.tag == 13 || sender.tag == 14 || sender.tag == 15) {
            hasEqualsBeenPressed = false
            isPerformingOperation = true
            
            if isCalculating == false && isCalculatingTwo == false {
                firstNumberInLabel = Double(calculatorLabel.text!)!
                firstOperation = Double(sender.tag)
                //Addition Operator (Tag 12)
                if sender.tag == 12 {
                    calculatorLabel.text = "+"
                    
                    //Subtraction Operator (Tag 13)
                } else if sender.tag == 13 {
                    calculatorLabel.text = "-"
                    
                    //Multiplication Operator (Tag 14)
                } else if sender.tag == 14 {
                    calculatorLabel.text = "×"
                    
                    //Division Operator (Tag 15)
                } else if sender.tag == 15 {
                    calculatorLabel.text = "÷"
                }
                isCalculating = true
                isCalculatingTwo = false
                
            } else if isCalculating == true {
                if firstOperation == 12 {
                    total = firstNumberInLabel + currentNumberInLabel
                }
                    
                else if firstOperation == 13 {
                    total = firstNumberInLabel - currentNumberInLabel
                }
                    
                else if firstOperation == 14 {
                    total = firstNumberInLabel * currentNumberInLabel
                }
                    
                else if firstOperation == 15 {
                    total = firstNumberInLabel / currentNumberInLabel
                }
                calculatorLabel.text = String(Double(total).roundToPlaces(places: 8))
                secondOperation = Double(sender.tag)
                secondNumberInLabel = Double(calculatorLabel.text!)!
                isCalculating = false
                isCalculatingTwo = true
                
            } else if isCalculatingTwo == true {
                if secondOperation == 12 {
                    total = secondNumberInLabel + currentNumberInLabel
                }
                    
                else if secondOperation == 13 {
                    total = secondNumberInLabel - currentNumberInLabel
                }
                    
                else if secondOperation == 14 {
                    total = secondNumberInLabel * currentNumberInLabel
                }
                    
                else if secondOperation == 15 {
                    total = secondNumberInLabel / currentNumberInLabel
                }
                calculatorLabel.text = String(Double(total).roundToPlaces(places: 8))
                secondOperation = Double(sender.tag)
                secondNumberInLabel = Double(calculatorLabel.text!)!
            }
        }
        
        //Equals Operator (Tag 11)
        if sender.tag == 11 {
            
            if isCalculating == true {
                if firstOperation == 12 {
                    total = firstNumberInLabel + currentNumberInLabel
                }
                
                else if firstOperation == 13 {
                    total = firstNumberInLabel - currentNumberInLabel
                }
                
                else if firstOperation == 14 {
                    total = firstNumberInLabel * currentNumberInLabel
                }
                
                else if firstOperation == 15 {
                    total = firstNumberInLabel / currentNumberInLabel
                }
                calculatorLabel.text = String(Double(total).roundToPlaces(places: 8))
                
            } else if isCalculatingTwo == true {
                if secondOperation == 12 {
                    total = secondNumberInLabel + currentNumberInLabel
                }
                    
                else if secondOperation == 13 {
                    total = secondNumberInLabel - currentNumberInLabel
                }
                    
                else if secondOperation == 14 {
                    total = secondNumberInLabel * currentNumberInLabel
                }
                    
                else if secondOperation == 15 {
                    total = secondNumberInLabel / currentNumberInLabel
                }
                calculatorLabel.text = String(Double(total).roundToPlaces(places: 8))
            }
            isCalculating = false
            isCalculatingTwo = false
            hasEqualsBeenPressed = true
        }
    }
    
    
    
    
    
    //Methods
    
    
}
