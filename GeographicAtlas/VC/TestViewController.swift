//
//  TestViewController.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 29.05.2023.
//

import UIKit

class TestViewController: UIViewController {
    
    let networkManager = DownloadManager()
    var countriesSorted = [String: Countries]()
    var countries: Countries?

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountries()

        
    }
    

    private func fetchCountries() {
        
        networkManager.getCountriesInfo(CCA2: nil) { result in
            switch result {
            case.failure(let error): print(error.localizedDescription)
            case.success(let resultCountries):
                DispatchQueue.main.async {
//                    self.countriesSorted = self.networkManager.sorting(resultCountries)
                    self.countries = resultCountries//.sorted(by: { country1, country2 in
//                        country1.region < country2.region
//                    })//.sorted(by: { country1, country2 in
                    //return country1.name.common < country2.name.common
                    //})
                }
            }
        }
    }

}
