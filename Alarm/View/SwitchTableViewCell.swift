//
//  SwitchTableViewCell.swift
//  Alarm
//
//  Created by Travis Chapman on 10/8/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import UIKit

protocol SwitchTableViewCellDelegate: class {
    
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell)
    
}

class SwitchTableViewCell: UITableViewCell {

    // MARK: - Constants & Variables
    var alarm: Alarm? {
        didSet {
            updateViews()
        }
    }
    
    // Declare the delegate variable
    weak var delegate: SwitchTableViewCellDelegate?
    
    // MARK: - Outlets
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    // MARK: - Actions
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        
        delegate?.switchCellSwitchValueChanged(cell: self)
        
    }

}

extension SwitchTableViewCell {
    
    func updateViews() {
        guard let alarm = alarm else { return }
        
        // Update the outlets
        timeLabel.text = alarm.fireDateAsString
        nameLabel.text = alarm.name
        alarmSwitch.isOn = alarm.enabled
        
    }
}
