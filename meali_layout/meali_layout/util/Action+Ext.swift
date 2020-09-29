//
//  Action+Ext.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/29.
//

import Action
import RxSwift

extension Action {
    func asVoidInputAction(input: Input) -> Action<Void, Element> {
        return Action<Void, Element>(enabledIf: enabled, workFactory: { [weak self] _ -> Observable<Element> in
            guard let self = self else { return .empty() }
            return self.execute(input)
        })
    }
    
    static func create(enabledIf: Observable<Bool> = Observable.just(true),
                       workObservable: Observable<Element>) -> Action<Input, Element> {
        return Action(enabledIf: enabledIf, workFactory: { _ in workObservable })
    }
    
    static func create(enabledIf: Observable<Bool> = Observable.just(true),
                       workClosure: @escaping (Input) -> Element) -> Action<Input, Element> {
        return Action(enabledIf: enabledIf, workFactory: { input -> Observable<Element> in
            return Observable<Element>.create({ (observer) -> Disposable in
                observer.onNext(workClosure(input))
                observer.onCompleted()
                return Disposables.create()
            })
        })
    }
}
