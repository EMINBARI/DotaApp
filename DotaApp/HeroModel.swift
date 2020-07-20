//
//  DataModel.swift
//  DotaApp
//
//  Created by Emin Bari on 18.07.2020.
//  Copyright © 2020 Emin Bari. All rights reserved.
//

import Foundation

//struct  HeroModel:Decodable {
//    let localized_name: String
//    let attack_type: String
//    let img: String
//    let icon: String
//    let base_health: Int
//}

class  HeroModel:Decodable {
    let data: [HeroData]
    //let ad: Ad
}

class  HeroData:Decodable {
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}

//struct Ad:Decodable{
//    let company: String
//    let url: String
//    let text: String
//}
