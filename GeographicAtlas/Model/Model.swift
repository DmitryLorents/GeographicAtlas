//
//  DataStorage.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import Foundation

typealias Countries = [Country]

// MARK: - CountryElement
struct Country: Codable {
    let name: Name
    let tld: [String]?
    let cca2: String
    let ccn3: String?
    let cca3: String
    let cioc: String?
    let independent: Bool?
    let status: Status
    let unMember: Bool
    let currencies: Currencies?
    let idd: Idd
    let capital: [String]?
    let altSpellings: [String]
    let region: Region
    let subregion: String?
    let languages: [String: String]?
    let translations: [String: Translation]
    let latlng: [Double]
    let landlocked: Bool
    let area: Double
    let demonyms: Demonyms?
    let flag: String
    let maps: Maps
    let population: Int
    let fifa: String?
    let car: Car
    let timezones: [String]
    let continents: [Continent]
    let flags: Flags
    let coatOfArms: CoatOfArms
    let startOfWeek: StartOfWeek
    let capitalInfo: CapitalInfo
    let gini: [String: Double]?
    let postalCode: PostalCode?
    let borders: [String]?
}

// MARK: - CapitalInfo
struct CapitalInfo: Codable {
    let latlng: [Double]?
}

// MARK: - Car
struct Car: Codable {
    let signs: [String]?
    let side: Side
}

enum Side: String, Codable {
    case sideLeft = "left"
    case sideRight = "right"
}

// MARK: - CoatOfArms
struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

// MARK: - Currencies
struct Currencies: Codable {
    let xcd, top, aud, xaf: Aed?
    let mga, kwd, iqd, eur: Aed?
    let npr, xof, ngn, wst: Aed?
    let usd, jmd, mnt, azn: Aed?
    let bgn, lyd, mad, byn: Aed?
    let thb, lbp, brl, pgk: Aed?
    let zwl, aoa, rwf, lak: Aed?
    let nio, crc, tmt, inr: Aed?
    let dzd, mru, srd, awg: Aed?
    let kgs, nok, uyu, kzt: Aed?
    let bam: BAM?
    let bob, xpf, tjs, hnl: Aed?
    let mvr, rsd, ang, kyd: Aed?
    let tzs, ghs, gbp, imp: Aed?
    let irr, nad, zar, bsd: Aed?
    let huf, mdl, czk, egp: Aed?
    let ils, jod, gnf, ttd: Aed?
    let twd, kes, nzd, ssp: Aed?
    let jep, tvd, khr, cuc: Aed?
    let cup, pyg, mxn, currenciesTRY: Aed?
    let bzd, bbd, fkp, sgd: Aed?
    let lkr, qar, cny, pen: Aed?
    let ggp, bhd, zmw, clp: Aed?
    let ron, mop, dkk, fok: Aed?
    let bif, shp, fjd, gyd: Aed?
    let etb, sll, php, mzn: Aed?
    let ern, vuv, sbd, all: Aed?
    let chf, rub, cad, gel: Aed?
    let bdt, dop, krw, hkd: Aed?
    let ugx, kid, gmd, jpy: Aed?
    let ckd, btn, cve, bwp: Aed?
    let gip, szl, uah, sek: Aed?
    let pab, bmd, isk, ves: Aed?
    let afn, bnd, cdf, kpw: Aed?
    let omr, aed, vnd, gtq: Aed?
    let idr, ars, cop, mkd: Aed?
    let djf, amd, lsl, tnd: Aed?
    let stn, sar, pln, htg: Aed?
    let syp, pkr, scr: Aed?
    let sdg: BAM?
    let mwk, lrd, myr, uzs: Aed?
    let mmk, sos, kmf, yer: Aed?
    let mur: Aed?

    enum CodingKeys: String, CodingKey {
        case xcd = "XCD"
        case top = "TOP"
        case aud = "AUD"
        case xaf = "XAF"
        case mga = "MGA"
        case kwd = "KWD"
        case iqd = "IQD"
        case eur = "EUR"
        case npr = "NPR"
        case xof = "XOF"
        case ngn = "NGN"
        case wst = "WST"
        case usd = "USD"
        case jmd = "JMD"
        case mnt = "MNT"
        case azn = "AZN"
        case bgn = "BGN"
        case lyd = "LYD"
        case mad = "MAD"
        case byn = "BYN"
        case thb = "THB"
        case lbp = "LBP"
        case brl = "BRL"
        case pgk = "PGK"
        case zwl = "ZWL"
        case aoa = "AOA"
        case rwf = "RWF"
        case lak = "LAK"
        case nio = "NIO"
        case crc = "CRC"
        case tmt = "TMT"
        case inr = "INR"
        case dzd = "DZD"
        case mru = "MRU"
        case srd = "SRD"
        case awg = "AWG"
        case kgs = "KGS"
        case nok = "NOK"
        case uyu = "UYU"
        case kzt = "KZT"
        case bam = "BAM"
        case bob = "BOB"
        case xpf = "XPF"
        case tjs = "TJS"
        case hnl = "HNL"
        case mvr = "MVR"
        case rsd = "RSD"
        case ang = "ANG"
        case kyd = "KYD"
        case tzs = "TZS"
        case ghs = "GHS"
        case gbp = "GBP"
        case imp = "IMP"
        case irr = "IRR"
        case nad = "NAD"
        case zar = "ZAR"
        case bsd = "BSD"
        case huf = "HUF"
        case mdl = "MDL"
        case czk = "CZK"
        case egp = "EGP"
        case ils = "ILS"
        case jod = "JOD"
        case gnf = "GNF"
        case ttd = "TTD"
        case twd = "TWD"
        case kes = "KES"
        case nzd = "NZD"
        case ssp = "SSP"
        case jep = "JEP"
        case tvd = "TVD"
        case khr = "KHR"
        case cuc = "CUC"
        case cup = "CUP"
        case pyg = "PYG"
        case mxn = "MXN"
        case currenciesTRY = "TRY"
        case bzd = "BZD"
        case bbd = "BBD"
        case fkp = "FKP"
        case sgd = "SGD"
        case lkr = "LKR"
        case qar = "QAR"
        case cny = "CNY"
        case pen = "PEN"
        case ggp = "GGP"
        case bhd = "BHD"
        case zmw = "ZMW"
        case clp = "CLP"
        case ron = "RON"
        case mop = "MOP"
        case dkk = "DKK"
        case fok = "FOK"
        case bif = "BIF"
        case shp = "SHP"
        case fjd = "FJD"
        case gyd = "GYD"
        case etb = "ETB"
        case sll = "SLL"
        case php = "PHP"
        case mzn = "MZN"
        case ern = "ERN"
        case vuv = "VUV"
        case sbd = "SBD"
        case all = "ALL"
        case chf = "CHF"
        case rub = "RUB"
        case cad = "CAD"
        case gel = "GEL"
        case bdt = "BDT"
        case dop = "DOP"
        case krw = "KRW"
        case hkd = "HKD"
        case ugx = "UGX"
        case kid = "KID"
        case gmd = "GMD"
        case jpy = "JPY"
        case ckd = "CKD"
        case btn = "BTN"
        case cve = "CVE"
        case bwp = "BWP"
        case gip = "GIP"
        case szl = "SZL"
        case uah = "UAH"
        case sek = "SEK"
        case pab = "PAB"
        case bmd = "BMD"
        case isk = "ISK"
        case ves = "VES"
        case afn = "AFN"
        case bnd = "BND"
        case cdf = "CDF"
        case kpw = "KPW"
        case omr = "OMR"
        case aed = "AED"
        case vnd = "VND"
        case gtq = "GTQ"
        case idr = "IDR"
        case ars = "ARS"
        case cop = "COP"
        case mkd = "MKD"
        case djf = "DJF"
        case amd = "AMD"
        case lsl = "LSL"
        case tnd = "TND"
        case stn = "STN"
        case sar = "SAR"
        case pln = "PLN"
        case htg = "HTG"
        case syp = "SYP"
        case pkr = "PKR"
        case scr = "SCR"
        case sdg = "SDG"
        case mwk = "MWK"
        case lrd = "LRD"
        case myr = "MYR"
        case uzs = "UZS"
        case mmk = "MMK"
        case sos = "SOS"
        case kmf = "KMF"
        case yer = "YER"
        case mur = "MUR"
    }
}

// MARK: - Aed
struct Aed: Codable {
    let name, symbol: String
}

// MARK: - BAM
struct BAM: Codable {
    let name: String
}

// MARK: - Demonyms
struct Demonyms: Codable {
    let eng: Eng
    let fra: Eng?
}

// MARK: - Eng
struct Eng: Codable {
    let f, m: String
}

// MARK: - Flags
struct Flags: Codable {
    let png: String
    let svg: String
    let alt: String?
}

// MARK: - Idd
struct Idd: Codable {
    let root: String?
    let suffixes: [String]?
}

// MARK: - Maps
struct Maps: Codable {
    let googleMaps, openStreetMaps: String
}

// MARK: - Name
struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

// MARK: - Translation
struct Translation: Codable {
    let official, common: String
}

// MARK: - PostalCode
struct PostalCode: Codable {
    let format: String
    let regex: String?
}

enum Region: String, Codable {
    case africa = "Africa"
    case americas = "Americas"
    case antarctic = "Antarctic"
    case asia = "Asia"
    case europe = "Europe"
    case oceania = "Oceania"
}

enum StartOfWeek: String, Codable {
    case monday = "monday"
    case saturday = "saturday"
    case sunday = "sunday"
}

enum Status: String, Codable {
    case officiallyAssigned = "officially-assigned"
    case userAssigned = "user-assigned"
}

//// MARK: - Country
//struct Country: Codable {
////    let name: Name
////    let tld: [String]?
//    let cca2: String
//////    let ccn3: String?
//////    let cca3: String
//////    let cioc: String?
//////    let independent: Bool?
//////    let status: Status
//////    let unMember: Bool
//////    let currencies: Currencies?
//////    let idd: Idd
////    let capital: [String]?
//////    let altSpellings: [String]
////    let region: Region
////    let subregion: String?
//////    let languages: [String: String]?
//////    let translations: [String: Translation]
//////    let latlng: [Double]
//////    let landlocked: Bool
//////    let borders: [String]?
////    let area: Double
//////    let demonyms: Demonyms?
////    let flag: String
//////    let maps: Maps
////    let population: Int
//////    let gini: [String: Double]?
//////    let fifa: String?
//////    let car: Car
////    let timezones: [String]
//////    let continents: [Continent]
////    let flags: Flags
//////    let coatOfArms: CoatOfArms
//////    let startOfWeek: StartOfWeek
////    let capitalInfo: CapitalInfo
//////    let postalCode: PostalCode?
//}
//
//// MARK: - CapitalInfo
//struct CapitalInfo: Codable {
//    let latlng: [Double]?
//}
//
////// MARK: - Car
////struct Car: Codable {
////    let signs: [String]?
////    let side: Side
////}
//
////enum Side: String, Codable {
////    case sideLeft = "left"
////    case sideRight = "right"
////}
//
////// MARK: - CoatOfArms
////struct CoatOfArms: Codable {
////    let png: String?
////    let svg: String?
////}
//
////enum Continent: String, Codable {
////    case africa = "Africa"
////    case antarctica = "Antarctica"
////    case asia = "Asia"
////    case europe = "Europe"
////    case northAmerica = "North America"
////    case oceania = "Oceania"
////    case southAmerica = "South America"
////}
//
//// MARK: - Currencies
//struct Currencies: Codable {
//    let eur, afn: Aed?
//    let sdg: BAM?
//    let bgn, usd, pln, nzd: Aed?
//    let tzs, mop, xof, czk: Aed?
//    let ugx, ttd, dzd, uah: Aed?
//    let mru, gel, ang, nad: Aed?
//    let zar, mkd, mur, aud: Aed?
//    let kid, xaf, qar, kyd: Aed?
//    let bwp, egp, ils, jod: Aed?
//    let vnd, gbp, jep, gyd: Aed?
//    let tvd, pgk, bsd, cve: Aed?
//    let omr, ves, bob, cad: Aed?
//    let nok, kgs, amd, cdf: Aed?
//    let chf, szl, dkk, fok: Aed?
//    let ngn, mwk, stn, fkp: Aed?
//    let gtq, bbd, ghs, nio: Aed?
//    let imp, aoa, dop, all: Aed?
//    let lyd, kwd, bhd, tmt: Aed?
//    let lrd, rub, php, xcd: Aed?
//    let ron, inr, mmk, bzd: Aed?
//    let mnt, sar, huf, ars: Aed?
//    let xpf, yer, sek, shp: Aed?
//    let brl, ssp, thb, currenciesTRY: Aed?
//    let bmd, bdt, sgd, mdl: Aed?
//    let kes, uyu, byn, lbp: Aed?
//    let btn, myr, kzt, tnd: Aed?
//    let gmd, syp, gnf, mzn: Aed?
//    let wst, twd, kpw, djf: Aed?
//    let srd, rwf, krw, jmd: Aed?
//    let mvr, pyg, idr, mga: Aed?
//    let iqd, hnl, mad, hkd: Aed?
//    let lkr, htg, cuc, cup: Aed?
//    let tjs, ckd, cop, uzs: Aed?
//    let gip, pen, pkr, clp: Aed?
//    let zmw, scr, crc, kmf: Aed?
//    let isk, jpy, fjd: Aed?
//    let bam: BAM?
//    let mxn, khr, irr, rsd: Aed?
//    let aed, azn, vuv, ern: Aed?
//    let npr, pab, ggp, sbd: Aed?
//    let zwl, awg, bnd, lak: Aed?
//    let top, lsl, sos, sll: Aed?
//    let bif, etb, cny: Aed?
//
//    enum CodingKeys: String, CodingKey {
//        case eur = "EUR"
//        case afn = "AFN"
//        case sdg = "SDG"
//        case bgn = "BGN"
//        case usd = "USD"
//        case pln = "PLN"
//        case nzd = "NZD"
//        case tzs = "TZS"
//        case mop = "MOP"
//        case xof = "XOF"
//        case czk = "CZK"
//        case ugx = "UGX"
//        case ttd = "TTD"
//        case dzd = "DZD"
//        case uah = "UAH"
//        case mru = "MRU"
//        case gel = "GEL"
//        case ang = "ANG"
//        case nad = "NAD"
//        case zar = "ZAR"
//        case mkd = "MKD"
//        case mur = "MUR"
//        case aud = "AUD"
//        case kid = "KID"
//        case xaf = "XAF"
//        case qar = "QAR"
//        case kyd = "KYD"
//        case bwp = "BWP"
//        case egp = "EGP"
//        case ils = "ILS"
//        case jod = "JOD"
//        case vnd = "VND"
//        case gbp = "GBP"
//        case jep = "JEP"
//        case gyd = "GYD"
//        case tvd = "TVD"
//        case pgk = "PGK"
//        case bsd = "BSD"
//        case cve = "CVE"
//        case omr = "OMR"
//        case ves = "VES"
//        case bob = "BOB"
//        case cad = "CAD"
//        case nok = "NOK"
//        case kgs = "KGS"
//        case amd = "AMD"
//        case cdf = "CDF"
//        case chf = "CHF"
//        case szl = "SZL"
//        case dkk = "DKK"
//        case fok = "FOK"
//        case ngn = "NGN"
//        case mwk = "MWK"
//        case stn = "STN"
//        case fkp = "FKP"
//        case gtq = "GTQ"
//        case bbd = "BBD"
//        case ghs = "GHS"
//        case nio = "NIO"
//        case imp = "IMP"
//        case aoa = "AOA"
//        case dop = "DOP"
//        case all = "ALL"
//        case lyd = "LYD"
//        case kwd = "KWD"
//        case bhd = "BHD"
//        case tmt = "TMT"
//        case lrd = "LRD"
//        case rub = "RUB"
//        case php = "PHP"
//        case xcd = "XCD"
//        case ron = "RON"
//        case inr = "INR"
//        case mmk = "MMK"
//        case bzd = "BZD"
//        case mnt = "MNT"
//        case sar = "SAR"
//        case huf = "HUF"
//        case ars = "ARS"
//        case xpf = "XPF"
//        case yer = "YER"
//        case sek = "SEK"
//        case shp = "SHP"
//        case brl = "BRL"
//        case ssp = "SSP"
//        case thb = "THB"
//        case currenciesTRY = "TRY"
//        case bmd = "BMD"
//        case bdt = "BDT"
//        case sgd = "SGD"
//        case mdl = "MDL"
//        case kes = "KES"
//        case uyu = "UYU"
//        case byn = "BYN"
//        case lbp = "LBP"
//        case btn = "BTN"
//        case myr = "MYR"
//        case kzt = "KZT"
//        case tnd = "TND"
//        case gmd = "GMD"
//        case syp = "SYP"
//        case gnf = "GNF"
//        case mzn = "MZN"
//        case wst = "WST"
//        case twd = "TWD"
//        case kpw = "KPW"
//        case djf = "DJF"
//        case srd = "SRD"
//        case rwf = "RWF"
//        case krw = "KRW"
//        case jmd = "JMD"
//        case mvr = "MVR"
//        case pyg = "PYG"
//        case idr = "IDR"
//        case mga = "MGA"
//        case iqd = "IQD"
//        case hnl = "HNL"
//        case mad = "MAD"
//        case hkd = "HKD"
//        case lkr = "LKR"
//        case htg = "HTG"
//        case cuc = "CUC"
//        case cup = "CUP"
//        case tjs = "TJS"
//        case ckd = "CKD"
//        case cop = "COP"
//        case uzs = "UZS"
//        case gip = "GIP"
//        case pen = "PEN"
//        case pkr = "PKR"
//        case clp = "CLP"
//        case zmw = "ZMW"
//        case scr = "SCR"
//        case crc = "CRC"
//        case kmf = "KMF"
//        case isk = "ISK"
//        case jpy = "JPY"
//        case fjd = "FJD"
//        case bam = "BAM"
//        case mxn = "MXN"
//        case khr = "KHR"
//        case irr = "IRR"
//        case rsd = "RSD"
//        case aed = "AED"
//        case azn = "AZN"
//        case vuv = "VUV"
//        case ern = "ERN"
//        case npr = "NPR"
//        case pab = "PAB"
//        case ggp = "GGP"
//        case sbd = "SBD"
//        case zwl = "ZWL"
//        case awg = "AWG"
//        case bnd = "BND"
//        case lak = "LAK"
//        case top = "TOP"
//        case lsl = "LSL"
//        case sos = "SOS"
//        case sll = "SLL"
//        case bif = "BIF"
//        case etb = "ETB"
//        case cny = "CNY"
//    }
//}
//
//// MARK: - Aed
//struct Aed: Codable {
//    let name, symbol: String
//}
//
//// MARK: - BAM
//struct BAM: Codable {
//    let name: String
//}
//
//
//
//// MARK: - Flags
//struct Flags: Codable {
//    let png: String
//}
//
//
////// MARK: - Maps
////struct Maps: Codable {
////    let googleMaps, openStreetMaps: String
////}
//
//// MARK: - Name
//struct Name: Codable {
//    let common: String
//}
//
//enum Region: String, Codable, CaseIterable, Comparable {
//    static func < (lhs: Region, rhs: Region) -> Bool {
//        lhs.rawValue < rhs.rawValue
//    }
//
//    case africa = "Africa"
//    case americas = "Americas"
//    case antarctic = "Antarctic"
//    case asia = "Asia"
//    case europe = "Europe"
//    case oceania = "Oceania"
//}
//
//
