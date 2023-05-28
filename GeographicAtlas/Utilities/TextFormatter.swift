//
//  TextFormatter.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 22.05.2023.
//

import Foundation

class TextFormatter {
    func area(_ quantity: Double?) -> String {
        guard let quantity = quantity else {return "No data"}
        let areaMeasurement = Measurement(value: quantity, unit: UnitArea.squareKilometers)
        let formatter = MeasurementFormatter()
        return formatter.string(from: areaMeasurement)
//        formatter.numberStyle = .decimal
//        formatter.groupingSeparator = " "
//        formatter.groupingSize = 3
//        let number = NSNumber(value: UInt(quantity))
//        return (formatter.string(from: number)  ?? "No data") + " km2"
    }
    
    func population(_ quantity: Int) -> String {
        return Double(quantity).kmFormatted
    }
    
    func timeZones(_ zones: [String]?) -> String {
        guard let zones = zones  else { return  "No data" }
        var timeZoneString = ""
        for zone in zones {
            timeZoneString.append( (timeZoneString.isEmpty ? zone : "\n\(zone)") )
        }
        return timeZoneString.isEmpty ? "No data" : timeZoneString
    }
}
