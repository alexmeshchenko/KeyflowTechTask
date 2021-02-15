//
//  Optional.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import Foundation

extension Optional where Wrapped == String {
    var asStringOrEmpty: String {
        self ?? ""
    }
}
