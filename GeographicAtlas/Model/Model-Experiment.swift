//
//  Model-Experiment.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 06.06.2023.
//

import Foundation


typealias CountriesEX = [CountryEX]

// MARK: - Country
struct CountryEX: Codable {
    
    var currencies: CurrencyContainer?
}

//struct CurrencyContainer: Codable {
//    var dictionary: [String: Currency]
//    
//    private struct DynamicCodingKeys: CodingKey, Hashable {
//        var intValue: Int? {return nil}
//        
//        init?(intValue: Int) {
//            return nil
//        }
//        
//        var stringValue: String
//        init?(stringValue: String) {
//            self.stringValue = stringValue
//        }
//    }
//    
//    init(from decoder: Decoder) throws {
//        var outputDictionary = [String: Currency]()
//        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
//        for key in container.allKeys {
//            let decodedObject = try container.decode(Currency.self, forKey: DynamicCodingKeys(stringValue: key.stringValue)!)
//            outputDictionary[key.stringValue] = decodedObject
//        }
//        self.dictionary = outputDictionary
//    }
//}
//
//struct Currency: Codable {
//    let name: String
//    let symbol: String?
//}


