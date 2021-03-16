//
//  DateFormatter+Extensions.swift
//  iOSArchitecturesDemo
//
//  Created by Grigory Stolyarov on 16.03.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func stringFormatted(date: Date, format: String) -> String {
        self.dateFormat = format
        return self.string(from: date)
    }
    
    func getDateFromPOSIXString(from dateString: String) -> Date? {
        self.locale = Locale(identifier: "en_US_POSIX")
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return self.date(from: dateString)
    }
    
}
