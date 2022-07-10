//
//  ExchangeModel.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 30.06.2022.
//

import Foundation
import ObjectMapper

class Value: Mappable {
    
    var id: Int?
    var abbreviation: String?
    var scale: Int?
    var name: String?
    var rate: Double?

    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id                  <- map["Cur_ID"]
        abbreviation        <- map["Cur_Abbreviation"]
        scale               <- map["Cur_Scale"]
        name                <- map["Cur_Name"]
        rate                <- map["Cur_OfficialRate"]

    }
}
