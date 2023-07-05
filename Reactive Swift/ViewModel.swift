//
//  ViewModel.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 3.07.2023.
//

import Foundation
import RxSwift

class ViewModel {
    
    let combinedPublisher = ReplaySubject<[ApiDataModel]>.create(bufferSize: 10)
    
    let techApi : ApiManagerProtocol
    let foodApi : ApiManagerProtocol
    
    let disposeBag = DisposeBag()
    
    init(techApi: ApiManagerProtocol, foodApi: ApiManagerProtocol) {
        self.techApi = techApi
        self.foodApi = foodApi
        getApiData()
    }
    
    func getApiData() {
        Observable.zip(techApi.publisher, foodApi.publisher).subscribe {
            model1, model2 in
            self.combinedPublisher.onNext(model1 + model2)
        }.disposed(by: disposeBag)
    }
}
