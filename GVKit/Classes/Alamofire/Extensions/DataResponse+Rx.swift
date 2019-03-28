//
//  DataResponse+Rx.swift
//  GVKit
//

import Foundation
import Alamofire
import RxSwift

extension PrimitiveSequenceType where TraitType == SingleTrait, ElementType: DataResponseType {
    
    func value() -> Single<ElementType.Value> {
        return self.flatMap({ (response) in
            switch response.result {
            case .success(let value):
                return Single.just(value)
            case .failure(let error):
                return Single.error(error)
            }
        })
    }
    
}
