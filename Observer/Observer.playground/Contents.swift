import UIKit

enum EventType {
    case pressBegan
    case pressEnded
}

protocol ButtonPublisherObserver  {
    var id: UUID {get}
    func update(event: EventType)
}


class ButtonPublisher {
    var observers: [EventType: [ButtonPublisherObserver]] = [:]
    
    func subscribe(eventType: EventType, observer: ButtonPublisherObserver) {
        defer {
            print("id: \(observer.id) added")
        }
        
        if observers[eventType] == nil {
            observers[eventType] = [observer]
            return
        }
        
        observers[eventType]!.append(observer)
    }
    
    func unsubscribe(eventType: EventType, observer: ButtonPublisherObserver) {
        defer {
            print("id: \(observer.id) removed")
        }
        observers[eventType]?.removeAll(where: {$0.id == observer.id})
        
    }
    
    func notify(event: EventType) {
        guard let observers = observers[event] else {return}
        observers.forEach { item in
            item.update(event: event)
        }
    }
}

class Button: UIButton {
    private(set) var buttonObservable: ButtonPublisher = ButtonPublisher()
    
    func pressesBegan() {
        buttonObservable.notify(event: .pressBegan)
    }
    
    func pressesEnded() {
        buttonObservable.notify(event: .pressEnded)
    }
}

class SquarButtonHandler: ButtonPublisherObserver {
    var id: UUID = UUID()
    weak var button: Button?
    
    init(button: Button) {
        self.button = button
        self.button?.buttonObservable.subscribe(eventType: .pressBegan, observer: self)
        self.button?.buttonObservable.subscribe(eventType: .pressEnded, observer: self)
    }
    
    deinit {
        print("SquarButtonHandler deinit")
    }
    
    func removeListner() {
        button?.buttonObservable.unsubscribe(eventType: .pressBegan, observer: self)
        button?.buttonObservable.unsubscribe(eventType: .pressEnded, observer: self)
    }
    
    func update(event: EventType) {
        print("event: \(event) inside SquarButton")
    }
}

class CircleButtonHandler: ButtonPublisherObserver {
    var id: UUID = UUID()
    weak var button: Button?
    
    init(button: Button) {
        self.button = button
        self.button?.buttonObservable.subscribe(eventType: .pressBegan, observer: self)
        self.button?.buttonObservable.subscribe(eventType: .pressEnded, observer: self)
    }
    
    func removeListner() {
        button?.buttonObservable.unsubscribe(eventType: .pressBegan, observer: self)
        button?.buttonObservable.unsubscribe(eventType: .pressEnded, observer: self)
    }
    
    func update(event: EventType) {
        print("event: \(event) inside CircleButton")
    }
}


// Main app
let button = Button()
func main() {
    var squareHandler: SquarButtonHandler? = SquarButtonHandler(button: button)
    let circleHandler = CircleButtonHandler(button: button)

    button.pressesBegan()
    button.pressesEnded()

    squareHandler?.removeListner()
    squareHandler = nil

    button.pressesBegan()
    print("Done")
}

main()
