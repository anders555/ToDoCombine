//
//  NetworkManager.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 21.06.2022.
//

import Foundation
import Moya
import Moya_ObjectMapper

final class NetworkManager {
    static private let provider = MoyaProvider<BackendApi>(plugins: [NetworkLoggerPlugin()])
    
    class func getNews(success: (([Article]) -> ())?, failure: (() -> ())?) {
        provider.request(.getNews) {result in
            switch result {
                
            case .success(let responce):
                guard let news = try? responce.mapObject(Content.self) else {failure?()
                    return}
                success?(news.content)
            case .failure(_):
                failure?()
            }
        }
    }
    
    class func getValueCourse (success: (([Value]) -> ())?, failure: (() -> ())?) {
        provider.request(.getValue) { result in
            switch result {
            case .success(let response):
                guard let values = try? response.mapArray(Value.self) else {
                    print("Не удалось распарсить ответ от сервера.")
                    failure?()
                    return
                }
                print("Удалось распарсить ответ от сервера.")
                success?(values)
            case .failure(let error):
                print(error.localizedDescription)
                failure?()
            }
        }
    }
}




//        case .success(let responce):
//            guard let result = try? responce.mapObject(Content.self) else {failureBlock?() return }
//            success?(result.content)
//            else {
//                failure?()
//                return
//            }
//            success?(result)
//        case .failure(_):
//            print ("Ошибка")
//            failure?()
//            }
//        }


