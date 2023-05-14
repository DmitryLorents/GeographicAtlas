//
//  DownloadManager.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import Foundation

class  DownloadManager {
    var urlString: String! //= "https://restcountries.com/v3.1/all"
    let decoder = JSONDecoder()
    
    func getCountriesInfo(CCA2: String?, completion: @escaping (Result<Countries, Error>) -> () ) {
        switch CCA2 {
        case.none:
            urlString = "https://restcountries.com/v3.1/all"
        case.some(let CCA2Text):
            urlString = "https://restcountries.com/v3.1/alpha/" + CCA2Text
        }
        guard let url = URL(string: urlString) else {
            print("Incorrect URL")
            return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let self = self else {
                print("No self")
                return }
            guard let downloadedData = data, error == nil else {
                completion(.failure(error!))
                return}
            
            
            guard let parsedData = try? self.decoder.decode(Countries.self, from: downloadedData) else {
                completion(.failure(error!))
                return}
            completion(.success(parsedData))
        }.resume()
    }
    
}
