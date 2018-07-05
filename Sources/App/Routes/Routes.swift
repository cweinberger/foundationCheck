import Vapor
import Foundation

extension Droplet {
    func setupRoutes() throws {
        get("hello") { req in
            var json = JSON()
            try json.set("hello", "world")
            return json
        }

        get("foundation") { req in

            try autoreleasepool() {
                let _ = try self.client.get("http://ipv4.download.thinkbroadband.com/50MB.zip")
            }
            return "Foundation!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        try resource("posts", PostController.self)
    }
}
