import Foundation

enum AppApperance {
    case dark
    case light
}

enum AppLocal {
    case es
    case en
}

class AppConfiguration {
    static let `default` = AppConfiguration()
    
    private(set) var appearance: AppApperance = .light
    private(set) var local: AppLocal  = .en
    
    func changeApperance(appearance: AppApperance) {
        self.appearance = appearance
    }
    
    func changeLocal(local: AppLocal) {
        self.local = local
    }
    
}



// Main app
func main() {
    
    assert(AppConfiguration.default.appearance == AppApperance.light)
    AppConfiguration.default.changeApperance(appearance: .dark)
    assert(AppConfiguration.default.appearance == AppApperance.dark)
    print("Done")
}

main()
