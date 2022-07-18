//
//  SettingsViewController.swift
//  Prework
//
//  Created by Eric Le on 7/18/22.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentageSlider: UISlider!
    
    @IBOutlet weak var presetSettingsLabel: UILabel!
    
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    @IBOutlet weak var defaultTipPercentageLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Setting"
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        print("setting will appear")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
        
        presetSettingsLabel.textColor = UIColor.gray
        
        // Access UserDefaults
        let defaults = UserDefaults.standard
        let tipPercentage = defaults.float(forKey: "tipPercentageValue")
        defaultTipPercentageLabel.text! = String(format: "Default tip: %02d%%", arguments: [Int(tipPercentage * 100)])
        defaultTipPercentageSlider.setValue(tipPercentage, animated: true)
    }
    
    @IBAction func defaultTipPercentageSliderValueChanged(_ sender: UISlider) {
        defaultTipPercentageLabel.text! = String(format: "Default tip: %02d%%", arguments: [Int(defaultTipPercentageSlider.value * 100)])
        
        let defaults = UserDefaults.standard
        
        defaults.set(defaultTipPercentageSlider.value, forKey: "tipPercentageValue")
        
        // Force UserDefaults to save.
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
