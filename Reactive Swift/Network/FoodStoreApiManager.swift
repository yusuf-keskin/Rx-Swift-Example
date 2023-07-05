//
//  FoodStoreApiManager.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 3.07.2023.
//

import Foundation
import RxSwift

class FoodStoreApiManager: ApiManagerProtocol {
    
    let publisher = PublishSubject<[ApiDataModel]>()
    
    init(){
        getStubApiData()
    }
    
    func getStubApiData() {
        
        let apiResponseStub = [
            ApiDataModel(name: "Karnıyarık", price: 500),
            ApiDataModel(name: "Köfte", price: 1000),
            ApiDataModel(name: "Künefe", price: 200),
            ApiDataModel(name: "İskilip Kebabı", price: 500),
//            ApiDataModel(name: "Altın Kaplama Pasta", price: 850)
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            self.publisher.onNext(apiResponseStub)
        }
        
    }
    
}
