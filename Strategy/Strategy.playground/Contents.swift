import Foundation

// Strategy pattern separate algorithm from the main class so it can be injected to tha main class using compisition
// instead of inhereting the algorithm from a base class and override it so an algorithm can be written one time and injected multiple time

protocol TapBehavior {
    func excute()
}

class SingleTap: TapBehavior {
    func excute() {
        print("Single tap behavior")
    }
}

class DoubleTap: TapBehavior {
    func excute() {
        print("Double tap behavior")
    }
}


class View {
    let tapBehavior: TapBehavior
    
    init(tapBehavior: TapBehavior) {
        self.tapBehavior = tapBehavior
    }
    
    func tap() {
        tapBehavior.excute()
    }
}


// Main app
func main() {
    // view with single tapping
    let view1 = View(tapBehavior: SingleTap())
    view1.tap()
    
    // view with Double tapping
    let view2 = View(tapBehavior: DoubleTap())
    view2.tap()
    
    
    print("Done")
}

main()
