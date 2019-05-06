//
//  SleepAddNewViewController.swift
//  umdplanner
//
//  Created by David Ma on 5/5/19.
//  Copyright © 2019 group42. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import Charts

class SleepAddNewViewController: UIViewController {
    var datePicker = UIDatePicker()
    var dateFormatter = DateFormatter()
    var toolBar = UIToolbar()
    var sleepTime : Date?
    var upTime : Date?
    var duration : TimeInterval?
    
    @IBOutlet weak var SleepTimePicker: UITextField!
    @IBOutlet weak var UpTimePicker: UITextField!
    @IBOutlet weak var DurationTextField: UILabel!
    
    @IBAction func SleepPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SleepTimePicker.inputView = datePicker
        UpTimePicker.inputView = datePicker
        
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolBar.setItems([doneButton], animated: true)
        SleepTimePicker.inputAccessoryView = toolBar
        UpTimePicker.inputAccessoryView = toolBar
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == SleepTimePicker {
            datePicker.datePickerMode = .date
        }
        if textField == UpTimePicker {
            datePicker.datePickerMode = .date
        }
    }
    
    @objc func doneButtonTapped() {
        if SleepTimePicker.isFirstResponder {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            SleepTimePicker.text = dateFormatter.string(from: datePicker.date)
            self.sleepTime = self.datePicker.date
            calculateDuration()
        }
        if UpTimePicker.isFirstResponder {
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            UpTimePicker.text = dateFormatter.string(from: datePicker.date)
            self.upTime = self.datePicker.date
            calculateDuration()
        }
        self.view.endEditing(true)
    }
    
    func calculateDuration() {
        if (upTime != nil && sleepTime != nil) {
            duration = upTime?.timeIntervalSince(sleepTime!)
            DurationTextField.text = stringFromTimeInterval(interval: duration!)
        }
    }
    
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let interval = Int(interval)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d hrs %02d min", hours, minutes)
    }
    
    func createData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        let managedContext = appDelegate.persistentContainer.viewContext
    }
    
}


