//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Zachary Pinto on 1/3/20.
//  Copyright © 2020 Zachary Pinto. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var perc1Field: UITextField!
    @IBOutlet weak var perc2Field: UITextField!
    @IBOutlet weak var perc3Field: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = UserDefaults.standard
        
        
        let perc1 = defaults.double(forKey: "percentage1") > 0 ? defaults.double(forKey: "percentage1") : 0.15
        
        let perc2 = defaults.double(forKey: "percentage2") > 0 ? defaults.double(forKey: "percentage2") : 0.18
        
        let perc3 = defaults.double(forKey: "percentage3") > 0 ? defaults.double(forKey: "percentage3") : 0.20
        
        
        perc1Field.text = String(perc1)
        perc2Field.text = String(perc2)
        perc3Field.text = String(perc3)
        
    }
    
    @IBAction func editPerc1(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(Double(perc1Field.text!), forKey: "percentage1")
        defaults.synchronize()
    }
    
    @IBAction func editPerc2(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(Double(perc2Field.text!), forKey: "percentage2")
        defaults.synchronize()
    }
    
    @IBAction func editPerc3(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(Double(perc3Field.text!), forKey: "percentage3")
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
