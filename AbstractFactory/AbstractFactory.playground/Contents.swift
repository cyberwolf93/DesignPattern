import UIKit

// Creating Rounded  buttons, circle  buttons
// Creating Rounded  views, circle  views


// Product Button
protocol Button {
    func draw()
    func click()
}

// Prodcut View
protocol View {
    func draw()
    func addChildreen()
}



// Concret Classes
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

class CircularButton: UIButton, Button {
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
        self.layer.cornerRadius = frame.width / 2
    }
}

class RoundedView: UIView, View {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func draw() {
        self.layer.cornerRadius = 5
    }
    
    func addChildreen() {
        print("Childreen added to rounded view")
    }
}

class CircularView: UIView, View {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func draw() {
        self.layer.cornerRadius = frame.width / 2
    }
    
    func addChildreen() {
        print("Childreen added to circular view")
    }
}


// Factories
protocol UIFactory {
    func createButton(frame: CGRect) -> Button
    func createView(frame: CGRect) -> View
}

class RoundedUIFactory: UIFactory {
    func createButton(frame: CGRect) -> Button {
        return RoundedButton(frame: frame)
    }
    
    func createView(frame: CGRect) -> View {
        return RoundedView(frame: frame)
    }
}

class CircularUIFactory {
    func createButton(frame: CGRect) -> Button {
        return CircularButton(frame: frame)
    }
    
    func createView(frame: CGRect) -> View {
        return CircularView(frame: frame)
    }
}



// Main app
func main() {
    // Create Rounded UI
    let roundedFactory = RoundedUIFactory()
    let roundedButton = roundedFactory.createButton(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
    let roundedView = roundedFactory.createView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    roundedButton.draw()
    roundedView.draw()
    roundedButton.click()
    roundedView.addChildreen()
    
    
    // Create circular UI
    let circularFactory = CircularUIFactory()
    let circularButton = circularFactory.createButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let circularView = circularFactory.createView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    circularButton.draw()
    circularView.draw()
    circularButton.click()
    circularView.addChildreen()
}

main()
