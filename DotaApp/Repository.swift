//
//  Repository.swift
//  DotaApp
//
//  Created by Emin Bari on 19.07.2020.
//  Copyright © 2020 Emin Bari. All rights reserved.
//

import Foundation

enum RequestErrors: Error{
    case noDataAvaliable
    case canNotProcessData
}

class Repository{
    let url: URL
    
    init(url: String) {
        guard let resUrl = URL(string: url) else{fatalError()}
        self.url = resUrl
    }
    
    func getData(complition: @escaping(Result<[HeroData], Error>) -> Void){
        let dataTask = URLSession.shared.dataTask(with: self.url){data, response, error in
            guard let jsonData = data else{
                complition(.failure(RequestErrors.noDataAvaliable))
                return
            }
            do{
                let decoder = JSONDecoder()
                let dataResponse = try decoder.decode(.self, from: jsonData)
                let dataDelatils = dataResponse.data
            }
            catch{
                complition(.failure(RequestErrors.canNotProcessData))
            }
        }
        dataTask.resume()
    }
    
}
