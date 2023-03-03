import Foundation


class NetworkEngine {
    func getApi(url: URL?) -> Data {
        print("Data requested with URL from NetworkEngine")
        return Data()
    }
}

// class NetworkFeed depend on NetworkEngine
class ClientApiFeed {
    let engine: NetworkEngine
    init(engine: NetworkEngine) {
        self.engine = engine
    }
    
    func getFeed() -> [AnyObject] {
        engine.getApi(url: URL(string: ""))
        return []
    }
}

class Database {
    func save(data: [AnyObject]) {
        print("Data saved in DB")
    }
}



class FeedManager {
    func get(pageNumber: Int, limit: Int) -> [AnyObject] {
        // 1- create a network engine
        let engine = NetworkEngine()
        // 2- create ClientApiFeed to request feed from server
        let clientApiFeed = ClientApiFeed(engine: engine)
        // 3- request the feed
        var feed = clientApiFeed.getFeed()
        // 4- do some modification like sorting
        feed = feed.sorted(by: { _,_ in true })
        // 5- create database instance
        let db = Database()
        // 6- save feed to database
        db.save(data: feed)
        
        // 7- return feed
        return feed
    }
}


// Main app
func main() {
    // Simple as that !!!
    let feed = FeedManager().get(pageNumber: 1, limit: 10)
    print("Done")
}

main()
