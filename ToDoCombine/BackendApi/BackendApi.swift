//
//  BackendApi.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 20.06.2022.
//

import Foundation
import Moya

enum BackendApi {
    case getNews
    case getValue
}


extension BackendApi: TargetType {
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://newsapi.org/")!
        case .getValue:
            return URL(string: "https://www.nbrb.by/")!
        }
      
    }
    
    var path: String {
        switch self{
        case .getNews:
            return "v2/top-headlines"
        case .getValue:
            return "api/exrates/rates"
        }
    }
    
    var method: Moya.Method {
        switch self{
        case .getNews:
            return .get
        case .getValue:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        guard let params = parameters else { return .requestPlain }
        return .requestParameters(parameters: params, encoding: encoding)
    }
    
    var parameters: [String: Any]? {
        var params = [String: Any]()
        switch self {
        case .getNews:
            params["country"] = "ru"
            params["category"] = ""
            params["apiKey"] = "e44ab22d84574ac7bc04219efb658c0f"
        case .getValue:
            params["periodicity"] = 0
        }
        return params
    }
    
    var encoding: ParameterEncoding {
        switch self { 
        case .getNews:
            return URLEncoding.queryString
        case .getValue:
            return URLEncoding.queryString
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

