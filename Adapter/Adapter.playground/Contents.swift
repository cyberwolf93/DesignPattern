
// Adapter pattern is good when you don't wan't to depend on a third party library
// whenever the third party library's code changes you always have to changes just the adapter code
// not the whole code 


import Foundation

class ThirdPartyText {
    func getSpeceficText() -> String {
        return "ThirdPartyText"
    }
}

protocol TextInterface {
    func getText() -> String
}

class FirstPartyText: TextInterface {
    func getText() -> String {
        return "FirstPartyText"
    }
}

class ThirdPartyTextAdapter: TextInterface {
    let thirdPartyText: ThirdPartyText
    
    init(thirdPartyText: ThirdPartyText) {
        self.thirdPartyText = thirdPartyText
    }
    
    func getText() -> String {
        return thirdPartyText.getSpeceficText()
    }
}

func print(text: TextInterface) {
    print(text.getText())
}

// Main app
func main() {
    // get text from first party class
    let firstPartyText = FirstPartyText()
    print(text: firstPartyText)
    
    // get text from third party class
    let thirdPartyText = ThirdPartyText()
//    print(text: thirdPartyText) // this code does not compile
    
    let thirdPartyTextAdapter = ThirdPartyTextAdapter(thirdPartyText: thirdPartyText)
    print(text: thirdPartyTextAdapter)
    
    print("Done")
}

main()
