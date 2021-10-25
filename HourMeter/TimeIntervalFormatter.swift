//
//  TimeIntervalFormatter.swift
//  HourMeter
//
//  Created by Daniel Jilg on 25.10.21.
//

import Foundation

extension DateComponentsFormatter {
    static let timeIntervalFormatter: DateComponentsFormatter = {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.zeroFormattingBehavior = .pad
        return formatter
    }()
    
    static func timeIntervalString(from timeInterval: TimeInterval) -> String {
        timeIntervalFormatter.string(from: timeInterval) ?? "–"
    }
}
