//
//  ViewController.swift
//  Prework
//
//  Created by Eric Le on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipPercentageSlider: UISlider!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var partySizeStepper: UIStepper!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    
    @IBOutlet weak var partySizeLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        partySizeStepper.wraps = true
        partySizeStepper.autorepeat = true
        partySizeStepper.maximumValue = 10
    }

    @IBAction func partySizeStepperChanged(_ sender: UIStepper) {
        partySizeLabel.text = Int(sender.value).description
    }
    
    @IBAction func tipPercentageSliderValueChanged(_ sender: UISlider) {
        let bill = Double(billAmountTextField.text!) ?? 0
        
        let tipPercentage = Double(round(tipPercentageSlider.value * 100)/100)
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
}

