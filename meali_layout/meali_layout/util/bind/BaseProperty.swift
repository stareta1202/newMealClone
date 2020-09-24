//
//  BaseProperty.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/23.
//

import RxSwift

class BaseProperty<Element>: ObservableType, ObserverType {
    func subscribe<Observer>(_ observer: Observer) -> Disposable where Observer: ObserverType, Element == Observer.Element {
        fatalError()
    }

    func on(_ event: Event<Element>) { fatalError() }
}
