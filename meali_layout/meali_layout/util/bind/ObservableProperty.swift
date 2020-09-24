//
//  ObservableProperty.swift
//  meali_layout
//
//  Created by 이용준 on 2020/09/24.
//
import RxSwift
import RxCocoa

@propertyWrapper
class ObservableProperty<Element>: BaseProperty<Element> {
    var wrappedValue: Element {
        didSet {
            subject.onNext(wrappedValue)
        }
    }
    
    private let subject: BehaviorSubject<Element>
    
    init(wrappedValue: Element) {
        self.wrappedValue = wrappedValue
        self.subject = BehaviorSubject<Element>(value: wrappedValue)
    }
    
    var projectedValue: Observable<Element> {
        return subject.asObservable()
    }
    
    override func subscribe<Observer>(_ observer: Observer) -> Disposable where Element == Observer.Element, Observer : ObserverType {
        return subject.subscribe(observer)
    }
    
    override func on(_ event: Event<Element>) {
        switch event {
        case .next(let element):
            wrappedValue = element
        default:
            break
        }
    }
}
