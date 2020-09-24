//
//  ObservableType+Ext.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/24.
//

import RxSwift

extension ObservableType {
    var main: Observable<Element> {
        return observeOn(MainScheduler.asyncInstance)
    }
    
    var void: Observable<Void> {
        return map { _ in return Void() }
    }
}

extension Observable where Element == Bool {
    var toggle: Observable<Bool> {
        return map { !$0 }
    }
}

extension ObservableType {
    public func bind<Observer: ObserverType>(onNext: Observer) -> Disposable where Observer.Element == Element {
        return subscribe(onNext: onNext.onNext)
    }
}

extension PrimitiveSequenceType where Trait == SingleTrait {
    public func subscribe<Observer: ObserverType>(onSuccess: Observer) -> Disposable where Observer.Element == Element {
        return primitiveSequence.asObservable().bind(onNext: onSuccess)
    }
}
