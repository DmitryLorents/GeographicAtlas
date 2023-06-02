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
    
    func coordinates(_ coordinates: [Double]?) -> String {
        guard let coordinates = coordinates else {return "No data"}
        guard coordinates.count > 1 else {return "No data"}
        let latDeg = Measurement(value: floor(coordinates[0]), unit: UnitAngle.degrees)
        let lonDeg = Measurement(value: floor(coordinates[1]), unit: UnitAngle.degrees)
        let latSec = Measurement(value: 100 * coordinates[0].truncatingRemainder(dividingBy: 1).magnitude, unit: UnitAngle.arcMinutes)
        let lonSec = Measurement(value: 100 * coordinates[1].truncatingRemainder(dividingBy: 1).magnitude, unit: UnitAngle.arcMinutes)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .temperatureWithoutUnit
        let latDegString = formatter.string(from: latDeg)
        let lonDegString = formatter.string(from: lonDeg)
        let latSecString = formatter.string(from: latSec)
        let lonSecString = formatter.string(from: lonSec)
        return "\(latDegString)\(latSecString), \(lonDegString)\(lonSecString)"
    }
}
