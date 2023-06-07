//
//  DataStorage.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import Foundation

typealias Countries = [Country]

// MARK: - Country
struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let currencies: CurrencyContainer?
    let capital: [String]?
    let region: Region
    let subregion: String?
    let area: Double
    let flag: String
    let population: Int
    let timezones: [String]
    let flags: Flags
    let capitalInfo: CapitalInfo    
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Currencies

struct CurrencyContainer: Codable {
    var dictionary: [String: Currency]
    
    private struct DynamicCodingKeys: CodingKey, Hashable {
        var intValue: Int? {return nil}
        
        init?(intValue: Int) {
            return nil
        }
        
        var stringValue: String
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
    }
    
    init(from decoder: Decoder) throws {
        var outputDictionary = [String: Currency]()
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        for key in container.allKeys {
            let decodedObject = try container.decode(Currency.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
            outputDictionary[key.stringValue] = decodedObject
        }
        self.dictionary = outputDictionary
    }
}

struct Currency: Codable {
    let name: String
    let symbol: String?
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
}

// MARK: - Name
struct Name: Codable {
    let common: String
}

enum Region: String, Codable, CaseIterable, Comparable {
    static func < (lhs: Region, rhs: Region) -> Bool {
        lhs.rawValue < rhs.rawValue
    }

    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
    
    static func key(for index: Int) -> String {
        switch index {
        case 0: return self.africa.rawValue
        case 1: return self.americas.rawValue
        case 2: return self.antarctic.rawValue
        case 3: return self.asia.rawValue
        case 4: return self.europe.rawValue
        case 5: return self.oceania.rawValue
        default: return self.africa.rawValue
        }
    }
    
}


