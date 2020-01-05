//
//  ViewController.swift
//  Tipper
//
//  Created by Zachary Pinto on 1/3/20.
//  Copyright © 2020 Zachary Pinto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    func updatePercs() {
        let defaults = UserDefaults.standard
        let tipPercentages = [defaults.double(forKey: "percentage1") > 0 ? defaults.double(forKey: "percentage1") : 0.15, defaults.double(forKey: "percentage2") > 0 ? defaults.double(forKey: "percentage2") : 0.18, defaults.double(forKey: "percentage3") > 0 ? defaults.double(forKey: "percentage3") : 0.20]
        
        for i in 0...2 {
            tipControl.setTitle(String(format: "%d", Int(tipPercentages[i] * 100)) + "%", forSegmentAt: i)
        }
        
        billField.text! = String(defaults.double(forKey: "billAmount"))
        
        calculateTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatePercs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updatePercs()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any? = nil) {
        let defaults = UserDefaults.standard
        
        defaults.set(Double(billField.text!), forKey: "billAmount")
        
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [defaults.double(forKey: "percentage1") > 0 ? defaults.double(forKey: "percentage1") : 0.15, defaults.double(forKey: "percentage2") > 0 ? defaults.double(forKey: "percentage2") : 0.18, defaults.double(forKey: "percentage3") > 0 ? defaults.double(forKey: "percentage3") : 0.20]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
}

