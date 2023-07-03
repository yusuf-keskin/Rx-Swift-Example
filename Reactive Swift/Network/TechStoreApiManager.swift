//
//  TechStoreApiManager.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 3.07.2023.
//

import Foundation
import RxSwift

class TechStoreApiManager: ApiManagerProtocol {
    
    let publisher = PublishSubject<ApiDataModel>()
    
    func getStubApiData() {
        let apiResponseStub = [
            ApiDataModel(name: "Qled TV", price: 500),
            ApiDataModel(name: "İphone 19", price: 1000),
            ApiDataModel(name: "USB Drive 1 TB", price: 200),
            ApiDataModel(name: "Xbox Series X", price: 500),
            ApiDataModel(name: "Air Frier", price: 850)
        ]
        apiResponseStub.forEach { model in
            publisher.onNext(model)
        }
    }
    
}
