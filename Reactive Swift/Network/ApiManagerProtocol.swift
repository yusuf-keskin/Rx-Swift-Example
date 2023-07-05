//
//  ApiManagerProtocol.swift
//  Reactive Swift
//
//  Created by YUSUF KESKİN on 3.07.2023.
//

import Foundation
import RxSwift

protocol ApiManagerProtocol {
    var publisher : PublishSubject<[ApiDataModel]> { get }
}
