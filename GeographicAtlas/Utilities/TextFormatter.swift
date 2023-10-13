//
//  TextFormatter.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 22.05.2023.
//

import Foundation

final class TextFormatter {
    
    //convert square kilometers from Double to String
    func area(_ quantity: Double?) -> String {
        guard let quantity else {return "No data"}
        let areaMeasurement = Measurement(value: quantity, unit: UnitArea.squareKilometers)
        let formatter = MeasurementFormatter()
        return formatter.string(from: areaMeasurement)
    }
    
    //format population quantity to 1K & 1m
    func population(_ quantity: Int) -> String {
        return Double(quantity).kmFormatted
    }

    //format [String] -> multy line String
    func timeZones(_ zones: [String]?) -> String {
        guard let zones  else { return  "No data" }
        var timeZoneString = ""
        for zone in zones {
            timeZoneString.append( (timeZoneString.isEmpty ? zone : "\n\(zone)") )
        }
        return timeZoneString.isEmpty ? "No data" : timeZoneString
    }
    //format degrees (Double) -> String
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
    //format currencies data -> multy line String
    func currencies(_ container: CurrencyContainer?) -> String {
        guard let container else {return "No data"}
        var outputString = ""
        for (key, value) in container.dictionary {
            let currencyAbreviature = key
            let currencySymbol = value.symbol ?? ""
            let currencyName = value.name
            let newLineString = "\(currencyName) (\(currencySymbol)) (\(currencyAbreviature))"
            //add several rows in case of key quantity > 1
            outputString = (outputString == "") ? newLineString : "\n" + newLineString
        }
        return outputString
    }
}
