//
//  DownloadManager.swift
//  GeographicAtlas
//
//  Created by Дмитрий Лоренц on 11.05.2023.
//

import Foundation

class  DownloadManager {
    let urlStringAll = "https://restcountries.com/v3.1/all"
    let decoder = JSONDecoder()
    
    func getCountries(completion: @escaping (Result<Countries, Error>) -> () ) {
        guard let url = URL(string: urlStringAll) else {return}
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let self = self else { return }
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
