//
//  NewsModel.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 21.06.2022.
//

import Foundation
import ObjectMapper

class Content: Mappable {
    var status: String?
    var content = [Article]()
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        content     <- map["articles"]
        status      <- map["status"]
    }
}

class Article: Mappable {
    var title: String?
    var description: String?
    var url: URL?
    var urlToImage: URL?
    var publishedAt: String?
    
    required init?(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        title                   <- map["title"]
        description             <- map["description"]
        url                     <- map["url"]
        urlToImage              <- map["urlToImage"]
        publishedAt             <- map["publishedAt"]
    }
}
