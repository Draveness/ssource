import Foundation
import RbSwift

public indirect enum Token {
    case leftBracket
    case rightBracket
    case leftParen
    case rightParen
    case colon
    case comma
    case equal
    case plain(String)

    case value(Token)
    case dict(exps: Token?)
    case exps(exps: Token, exp: Token?)
    case exp(token: Token, value: Token)
    case arr(exps: Token?)
    case arrExps(exps: Token, exp: Token?)
    case arrExp(token: Token)
}

extension Token: Equatable {
    public static func ==(lhs: Token, rhs: Token) -> Bool {
        switch (lhs, rhs) {
        case (let .plain(lstr), let .plain(rstr)):
            return lstr == rstr
        case (.leftBracket, leftBracket):
            return true
        case (.rightBracket, rightBracket):
            return true
        case (.leftParen, leftParen):
            return true
        case (.rightParen, rightParen):
            return true
        case (.colon, colon):
            return true
        case (.comma, comma):
            return true
        case (.equal, equal):
            return true
        default:
            return false
        }
    }
}

extension Token: CustomStringConvertible {
    public var description: String {
        switch self {
        case .dict:
            return "Dict"
        case .arr:
            return "Array"
        case .exps:
            return "Exps"
        case .exp:
            return "Exp"
        case .arrExps:
            return "ArrayExps"
        case .arrExp:
            return "ArrayExp"
        case .value:
            return "Value"
        case .plain:
            return "Token"
        case .leftBracket:
            return "{"
        case .rightBracket:
            return "}"
        case .leftParen:
            return "("
        case .rightParen:
            return ")"
        case .colon:
            return ";"
        case .comma:
            return ","
        case .equal:
            return "="
        }
    }
}

extension Token {
    public var toJSON: Any {
        switch self {
        case .dict(let exps):
            return exps?.toJSON ?? [:]
        case .arr(let exps):
            return exps?.toJSON ?? []
        case .exps(let exps, let exp):
            var results: [String: Any] = [:]
            if let json = exps.toJSON as? [String: Any] { results = results + json }
            if let json = exp?.toJSON as? [String: Any] { results = results + json }
            return results
        case .exp(let token, let value):
            return [token.toJSON as! String: value.toJSON]
        case .arrExps(let exps, let exp):
            var results: [Any] = []
            if let json = exps.toJSON as? [Any] { results += json }
            if let json = exp?.toJSON as? [Any] { results += json }
            return results
        case .arrExp(let token):
            return [token.toJSON as! String]
        case .value(let token):
            return token.toJSON
        case .plain(let str):
            return str
        default:
            return ""
        }
    }
}
