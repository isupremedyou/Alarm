//
//  AlarmController.swift
//  Alarm
//
//  Created by Travis Chapman on 10/8/18.
//  Copyright © 2018 Travis Chapman. All rights reserved.
//

import Foundation

class AlarmController {
    
    // MARK: - Constants & Variables
    
    // Shared instance
    static var shared = AlarmController()
    
    // Shared truth
    var alarms: [Alarm] = []
    
    init() {
        loadFromPersistentStore()
    }
    
}

extension AlarmController {
    
    // MARK: - CRUD Functions
    
    // Create
    func add(fireDate: Date, name: String, enabled: Bool) -> Alarm {
        let newAlarm = Alarm(fireDate, name, enabled)
        
        alarms.append(newAlarm)
        
        return newAlarm
    }
    
    // Update
    func update(oldAlarm: Alarm, fireDate: Date, name: String, enabled: Bool) {
        guard let index = alarms.firstIndex(of: oldAlarm) else { return }
        
        alarms[index].fireDate = fireDate
        alarms[index].name = name
        alarms[index].enabled = enabled
    }
    
    // Delete
    func delete(alarm: Alarm) {
        guard let index = alarms.firstIndex(of: alarm) else { return }
        
        alarms.remove(at: index)
    }
    
    
    // MARK: - Persistence Functions
    
    // Create the full fileURL and return it
    func fileURL() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let filename = "alarms.json"
        let fullURL = documentDirectory.appendingPathComponent(filename)
        
        return fullURL
    }
    
    // Save data to the persistent store
    func saveToPersistentStore() {
        let je = JSONEncoder()
        do {
            let data = try je.encode(alarms)
            try data.write(to: fileURL())
        } catch let error {
            print(error)
        }
    }
    
    // Load data from the persistent store
    func loadFromPersistentStore() {
        let jd = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let alarms = try jd.decode([Alarm].self, from: data)
            self.alarms = alarms
        } catch let error {
            print(error)
        }
        
    }
    
}
