import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    let key: SecKey
    
//    #if swift(>=5.0)
//    print("Hello, Swift 5.0")
//    #elseif swift(>=4.1)
//    print("Hello, Swift 4.1")
//    #elseif swift(>=4.0)
//    print("Hello, Swift 4.0")
//    #elseif swift(>=3.0)
//    print("Hello, Swift 3.0")
//    #elseif swift(>=2.2)
//    print("Hello, Swift 2.2")
//    #elseif swift(>=2.1)
//    print("Hello, Swift 2.1")
//    #endif

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
