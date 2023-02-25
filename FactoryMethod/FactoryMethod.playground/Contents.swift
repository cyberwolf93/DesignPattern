import UIKit


// Products
protocol Button {
    func draw()
    func click()
}

class RoundedButton: UIButton, Button {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click() {
        print("Rounded button clicked")
    }
    
    func draw() {
        self.layer.cornerRadius = 5
    }
}

class CircleButton: UIButton, Button {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click() {
        print("Circle button clicked")
    }
    
    func draw() {
        self.layer.cornerRadius = 5
    }
}

class SimbleButton: UIButton, Button {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func click() {
        print("Circle button clicked")
    }
    
    func draw() {
        
    }
}

// Factories
protocol ButtonFactory {
    func createButton(frame: CGRect) -> Button
}

class RoundedButtonFactory: ButtonFactory {
    func createButton(frame: CGRect) -> Button {
        return RoundedButton(frame: frame)
    }
}

class CircleButtonFactory {
    func createButton(frame: CGRect) -> Button {
        return CircleButton(frame: frame)
    }
}

class SimbleButtonFactory {
    func createButton(frame: CGRect) -> Button {
        return SimbleButton(frame: frame)
    }
}


// Main app
func main() {
    // Create Rounded Button
    let roundedButtonFactory = RoundedButtonFactory()
    let roundedButton = roundedButtonFactory.createButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
    roundedButton.draw()
    roundedButton.click()
    
    // Create Rounded Button
    let circleButtonFactory = CircleButtonFactory()
    let circleButton = circleButtonFactory.createButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    circleButton.draw()
    circleButton.click()
}

main()
