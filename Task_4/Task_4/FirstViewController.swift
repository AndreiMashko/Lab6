//
//  FirstViewController.swift
//  Task_4
//
//  Created by Admin on 15.04.17.
//  Copyright © 2017 Mashko. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var heighTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var weighTextField: UITextField!
    
    @IBOutlet weak var sexSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var activitySegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    @IBAction func calculateTapped(_ sender: Any) {
        var bmr: Double = 0
        var bmi: Double = 0
        if let age: Int = Int(ageTextField.text!) {
            if let height: Int = Int(heighTextField.text!) {
                if let weight: Int = Int(weighTextField.text!) {
                    switch sexSegmentedControl.selectedSegmentIndex {
                    case 0:
                        bmr = 88.362 + 13.397 * Double(weight) + 4.799 *
                            Double(height) - 5.677 * Double(age)
                    case 1:
                        bmr = 447.593 + 9.247 * Double(weight) + 3.098 *
                            Double(height) - 4.330 * Double(age)
                    default:
                        bmr = 0
                    }
                    bmi = Double(weight) / pow(Double(height) / 100, 2)
                }
            }
        }
        let factor = [1.375, 1.55, 1.725, 1.9]
        let selectedFactor =
            factor[activitySegmentedControl.selectedSegmentIndex]
        bmr *= selectedFactor
        
        resultsLabel.text = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела \(Int(bmi))."
        
        UIApplication.shared.keyWindow!.endEditing(true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

