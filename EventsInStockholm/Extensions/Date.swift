//
//  Date.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import Foundation

extension Date {
    func displayTimeInterval() -> String? {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.day, .hour, .minute, .second]
        formatter.unitsStyle = .full
        formatter.maximumUnitCount = 1

        return formatter.string(from: Date(), to: self)
    }

    func getWeekDay() -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "EEE"
           let weekDay = dateFormatter.string(from: self)
           return weekDay
     }
    
    func getDay() -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "dd"
           let weekDay = dateFormatter.string(from: self)
           return weekDay
     }
    
    func getMonth() -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "MMM"
           let weekDay = dateFormatter.string(from: self)
           return weekDay
     }
    
    func getTime() -> String? {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "hh:mm"
           let weekDay = dateFormatter.string(from: self)
           return weekDay
     }

}

