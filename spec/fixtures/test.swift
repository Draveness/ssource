class Token {
    public let toJSON: Any
    private(set) var variable: Int

    public func method(name: Int) -> Any
    public class func anotherMethod() -> Int
    public static func otherMethods()
}

class Klass {
}
