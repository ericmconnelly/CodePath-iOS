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
    
    @IBOutlet weak var costPerPersonLabel: UILabel!
    @IBOutlet weak var partySizeLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.float(forKey: "tipPercentageValue")
        let roundedTipPercentage = Double(round(tipPercentage * 100)/100)
        
        let bill = defaults.double(forKey: "billAmount") ?? 0
        billAmountTextField.text = String(bill)
        
        partySizeLabel.text = "1"
        
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentage * 100)])
        tipPercentageSlider.setValue(Float(roundedTipPercentage), animated: true)
    }

    @IBAction func billAmountChanged(_ sender: UITextField) {
        let bill = Double(String(sender.text!)) ?? 0.0
        
        print("bill amount changed", bill)
        
        let defaults = UserDefaults.standard
        
        defaults.set(bill, forKey: "billAmount")
        // Force UserDefaults to save.
        defaults.synchronize()
        
        let tipPercentage = Double(round(tipPercentageSlider.value * 100)/100)
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "Tip Calculator"
        partySizeStepper.wraps = true
        partySizeStepper.autorepeat = true
        partySizeStepper.minimumValue = 1;
        partySizeStepper.maximumValue = 10
    }

    @IBAction func partySizeStepperChanged(_ sender: UIStepper) {
        let defaults = UserDefaults.standard
        let bill = defaults.double(forKey: "billAmount")
        
        partySizeLabel.text = Int(sender.value).description

        
        let tipPercentage = Double(round(tipPercentageSlider.value * 100)/100)
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        let billPerPerson = total / Double(sender.value)
        
        costPerPersonLabel.text! = String(format: "$%.2f per person", arguments: [billPerPerson])
    }
    
    @IBAction func tipPercentageSliderValueChanged(_ sender: UISlider) {
        let defaults = UserDefaults.standard
        let bill = defaults.double(forKey: "billAmount")
        
        let tipPercentage = Double(round(tipPercentageSlider.value * 100)/100)
        
        let partySize = Double(partySizeLabel.text!)
        
        let tip = bill * tipPercentage
        let total = bill + tip
        
        tipPercentageLabel.text! = String(format: "Tip: %02d%%", arguments: [Int(tipPercentageSlider.value * 100)])
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
        
        let billPerPerson = total / Double(partySize!)
        
        costPerPersonLabel.text! = String(format: "$%.2f per person", arguments: [billPerPerson])
    }
}

