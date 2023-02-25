import UIKit


protocol UIBuilder {
    associatedtype T: UIView
    var viewToBuild: T {set get}
    var forgroundColor: UIColor {set get}
    var backgroundColor: UIColor {set get}
    func setForgroundColor(color: UIColor) -> Self
    func setBackgroundColor(color: UIColor) -> Self
    func reset()
    func build() -> T
}

class ButtonBuilder: UIBuilder {
    
    var viewToBuild: UIButton = UIButton()
    private var title = ""
    var forgroundColor: UIColor = .clear
    var backgroundColor: UIColor = .clear
    
    func setTitle(string: String) -> Self {
        title = string
        return self
    }
    
    func setForgroundColor(color: UIColor) ->  Self {
        forgroundColor = color
        return self
    }
    
    func setBackgroundColor(color: UIColor) ->  Self {
        backgroundColor = color
        return self
    }
    
    func reset() {
        viewToBuild = UIButton()
        title = ""
        forgroundColor = .clear
        backgroundColor = .clear
    }
    
    func build() -> UIButton {
        viewToBuild.setTitle(title, for: .normal)
        viewToBuild.setTitleColor(forgroundColor, for: .normal)
        viewToBuild.backgroundColor = backgroundColor
        return viewToBuild
    }
    
}

class ViewBuilder: UIBuilder {
    
    var viewToBuild: UIView = UIView()
    var forgroundColor: UIColor = .clear
    var backgroundColor: UIColor = .clear
    
    func setForgroundColor(color: UIColor) ->  Self {
        forgroundColor = color
        return self
    }
    
    func setBackgroundColor(color: UIColor) ->  Self {
        backgroundColor = color
        return self
    }
    
    func reset() {
        viewToBuild = UIView()
        forgroundColor = .clear
        backgroundColor = .clear
    }
    
    func build() -> UIView {
        viewToBuild.backgroundColor = backgroundColor
        return viewToBuild
    }
    
}


class Director {
    func makeButton(builder: ButtonBuilder) {
        builder
            .setForgroundColor(color: .black)
            .setBackgroundColor(color: .white)
        
    }
    
    func makeView(builder: ViewBuilder) {
        builder
            .setBackgroundColor(color: .white)
    }
}



// Main app
func main() {
    let builderDirector = Director()
    let buttonBuilder = ButtonBuilder()
    builderDirector.makeButton(builder: buttonBuilder)
    let button = buttonBuilder
        .setTitle(string: "Button")
        .build()
    
    assert(button.titleLabel?.text == "Button")
    assert(button.backgroundColor == .white)
    assert(button.titleLabel?.textColor == .black)
    
    let viewBuilder = ViewBuilder()
    builderDirector.makeView(builder: viewBuilder)
    let view = viewBuilder.build()
    
    assert(view.backgroundColor == .white)
    
    print("Done")
}

main()
