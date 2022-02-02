//
//  SettingsViewController.swift
//  Prework
//
//  Created by Patrick Brothers on 2/1/22.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var currencyTextView: UITextField!
    @IBOutlet weak var default1TextField: UITextField!
    @IBOutlet weak var default2TextField: UITextField!
    @IBOutlet weak var default3TextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let default1 = UserDefaults.standard.integer(forKey: "default1")
        let default2 = UserDefaults.standard.integer(forKey: "default2")
        let default3 = UserDefaults.standard.integer(forKey: "default3")
        default1TextField.text = ("\(default1)%")
        default2TextField.text = ("\(default2)%")
        default3TextField.text = ("\(default3)%")
    }
    
    @IBAction func changeCurrency(_ sender: Any) {
        UserDefaults.standard.set(currencyTextView.text, forKey: "currency")
    }
    
    @IBAction func changeDefaultOne(_ sender: Any) {
        change(defaultField: default1TextField, number: 1)
    }
    @IBAction func changeDefaultTwo(_ sender: Any) {
        change(defaultField: default2TextField, number: 2)
    }
    @IBAction func changeDefaultThree(_ sender: Any) {
        change(defaultField: default3TextField, number: 3)
    }
    
    func change(defaultField: UITextField, number: Int) {
        let text = defaultField.text!
        let range = text.startIndex..<text.index(before: text.endIndex)
        let percentage = Int(text[range])
        UserDefaults.standard.set(percentage, forKey: "default\(number)")
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
