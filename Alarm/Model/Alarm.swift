//
//  Alarm.swift
//  Alarm
//
//  Created by Travis Chapman on 10/8/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

class Alarm {
    
    // MARK: - Properties
    var fireDate: Date
    var name: String
    var enabled: Bool
    let uuid: String
    
    var fireDateAsString: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter.string(from: fireDate)
    }
    
    // MARK: - Initializer
    init(_ fireDate: Date, _ name: String = "Alarm", _ enabled: Bool) {
        self.fireDate = fireDate
        self.name = name
        self.enabled = enabled
        self.uuid = UUID().uuidString
        print(self.uuid)
    }

}

extension Alarm: Equatable {
    
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
}

extension Alarm: Codable
