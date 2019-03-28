//
//  Rx+SocketIO.swift
//  GVKit
//

import Foundation
import RxSwift

#if canImport(SocketIO)
import SocketIO

public extension Reactive where Base: SocketIOClient {
    
    func on(clientEvent: SocketClientEvent) -> Observable<[Any]> {
        return Observable.create { observer in
            let id = self.base.on(clientEvent: clientEvent, callback: { (items, socketAckEmitter) in
                observer.onNext(items)
            })
            
            return Disposables.create {
                self.base.off(id: id)
            }
        }
    }
    
    func once(clientEvent: SocketClientEvent) -> Single<[Any]> {
        return Single.create { eventHandler in
            let id = self.base.once(clientEvent: clientEvent, callback: { (items, socketAckEmitter) in
                eventHandler(.success(items))
            })
            
            return Disposables.create {
                self.base.off(id: id)
            }
        }
    }
    
    func on(_ event: String) -> Observable<[Any]> {
        return Observable.create { observer in
            let id = self.base.on(event) { items, socketAckEmitter in
                observer.onNext(items)
            }
            
            return Disposables.create {
                self.base.off(id: id)
            }
        }
    }
    
    func once(_ event: String) -> Single<[Any]> {
        return Single.create { eventHandler in
            let id = self.base.once(event) { items, socketAckEmitter in
                eventHandler(.success(items))
            }
            
            return Disposables.create {
                self.base.off(id: id)
            }
        }
    }
    
    func emit(_ event: String, with items: [Any]) -> Completable {
        return Completable.create(subscribe: { (eventHandler) -> Disposable in
            self.base.emit(event, with: items, completion: {
                eventHandler(.completed)
            })
            
            return Disposables.create()
        })
    }
    
}
#endif
