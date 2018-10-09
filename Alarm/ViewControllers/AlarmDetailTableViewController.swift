//
//  AlarmDetailTableViewController.swift
//  Alarm
//
//  Created by Travis Chapman on 10/8/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {
    
    // MARK: - Constants & Variables
    var alarm: Alarm? {
        didSet {
            loadViewIfNeeded()
            updateViews()
        }
    }
    var alarmIsOn: Bool {
        loadViewIfNeeded()
        if enableButton.titleLabel?.text == "On" {
            return true
        } else if enableButton.titleLabel?.text == "Off" {
            return false
        } else {
            alarmDatePicker.date = Date()
            
            enableButton.setTitle("On", for: .normal)
            enableButton.setTitleColor(UIColor.white, for: .normal)
            enableButton.backgroundColor = UIColor.gray
            return true
        }
    }
    
    // MARK: - Outlets
    @IBOutlet weak var alarmDatePicker: UIDatePicker!
    @IBOutlet weak var alarmNameTextField: UITextField!
    @IBOutlet weak var enableButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let alarmName = alarmNameTextField.text,
            !alarmName.isEmpty
            else { return }
        if let alarm = alarm {
            AlarmController.shared.update(oldAlarm: alarm, fireDate: alarmDatePicker.date, name: alarmName, enabled: alarmIsOn)
        } else {
            alarm = AlarmController.shared.add(fireDate: alarmDatePicker.date, name: alarmName, enabled: alarmIsOn)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func enableButtonTapped(_ sender: UIButton) {
        if enableButton.titleLabel?.text == "On" {
            enableButton.setTitle("Off", for: .normal)
            enableButton.setTitleColor(UIColor.white, for: .normal)
            enableButton.backgroundColor = UIColor.red
        } else if enableButton.titleLabel?.text == "Off" {
            enableButton.setTitle("On", for: .normal)
            enableButton.setTitleColor(UIColor.white, for: .normal)
            enableButton.backgroundColor = UIColor.gray
        }
    }
    
}

extension AlarmDetailTableViewController {
    private func updateViews() {
        // Unwrap the alarm
        guard let alarm = alarm else { return }
        
        // Set the data from the existing alarm
        alarmDatePicker.date = alarm.fireDate
        alarmNameTextField.text = alarm.name
        if alarm.enabled {
            enableButton.setTitle("On", for: .normal)
            enableButton.setTitleColor(UIColor.white, for: .normal)
            enableButton.backgroundColor = UIColor.gray
        } else {
            enableButton.setTitle("Off", for: .normal)
            enableButton.setTitleColor(UIColor.white, for: .normal)
            enableButton.backgroundColor = UIColor.red
        }
    }
}
