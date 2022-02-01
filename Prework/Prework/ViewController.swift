//
//  ViewController.swift
//  Prework
//
//  Created by Patrick Brothers on 1/28/22.
//

import UIKit

class ViewController: UIViewController {
    var tip = 0.15
    var currency = "$"
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    // activatge when text field is edited
    @IBAction func editTextField(_ sender: Any) {
        tipAmountLabel.text = "\(currency)0.00"
        totalLabel.text = "\(currency)0.00"
        displayTipPercentage()
        calculateTip()
    }
    
    
    // activate when tip slider is changed
    @IBAction func changeTipSlider(_ sender: Any) {
        tip = Double(Int(tipSlider.value*100.0))/100.0
        displayTipPercentage()
        calculateTip()
    }
    
    
    // activate when tip controller is changed
    @IBAction func changeTipController(_ sender: Any) {
        let tipPercentages = [0.15, 0.18, 0.2]
        tip = tipPercentages[tipControl.selectedSegmentIndex]
        displayTipPercentage()
        calculateTip()
    }
    
    
    // displays the tip percentage
    func displayTipPercentage() {
        // Obtain tip percentage
        let tipPercent = tip
        
        // Obtain Tip Percentage label
        tipPercentageLabel.text = String(format: "%0.2f%%", (tipPercent*100))
    }
    
    
    // calculate the tip from available data
    func calculateTip() {
        // Get bill from input field
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get total by multiplying (1 + tip)*bill
        let tipPercentage = tip//Double(tipSlider.value)
        let tip = bill * tipPercentage
        let total = bill + tip
        
        // Update tip label
        tipAmountLabel.text = String(format: "\(currency)%.2f", tip)
        // Update total label
        totalLabel.text = String(format: "\(currency)%.2f", total)
    }
    
}

