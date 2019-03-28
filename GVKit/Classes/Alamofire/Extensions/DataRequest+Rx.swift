//
//  DataRequest+Rx.swift
//  GVKit
//

//import Foundation
//import Alamofire
//#if canImport(AlamofireImage)
//import AlamofireImage
//#endif
//import RxSwift
//
//extension DataRequest: ReactiveCompatible {}
//
//#if canImport(AlamofireImage)
//
//extension Reactive where Base: DataRequest {
//    
//    func responseImage(imageScale: CGFloat = DataRequest.imageScale, inflateResponseImage: Bool = true) -> Single<DataResponse<Image>> {
//        return Single.create(subscribe: { [weak base] (eventHandler) -> Disposable in
//            base?.responseImage(
//                imageScale: imageScale,
//                inflateResponseImage: inflateResponseImage,
//                queue: nil,
//                completionHandler: { (dataResponse) in
//                    eventHandler(.success(dataResponse))
//            }
//            )
//            
//            return Disposables.create {
//                base?.cancel()
//            }
//        })
//    }
//    
//}
//#endif
