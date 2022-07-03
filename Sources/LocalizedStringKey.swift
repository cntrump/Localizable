//
//  LocalizedStringKey.swift
//  
//
//  Created by Lvv.me on 2022/7/3.
//

import Foundation

public struct LocalizedStringKey: ExpressibleByStringInterpolation {

    public struct StringInterpolation: StringInterpolationProtocol {

        var values: [String]

        var args: [CVarArg]

        public init(literalCapacity: Int, interpolationCount: Int) {
            values = [String]()
            values.reserveCapacity(literalCapacity)

            args = [CVarArg]()
            args.reserveCapacity(interpolationCount)
        }

        public mutating func appendLiteral(_ literal: String) {
            values.append(literal)
        }

        public mutating func appendInterpolation<T>(_ literal: T, specifier: String) where T: CVarArg {
            args.append(literal)
            values.append(specifier)
        }
    }

    var stringInterpolation: StringInterpolation

    public var key: String { stringInterpolation.values.reduce("", { $0 + $1 }) }

    public var args: [CVarArg] { stringInterpolation.args }

    public var description: String { args.isEmpty ? key : String(format: key, arguments: args) }

    public init(stringLiteral value: String) {
        stringInterpolation = StringInterpolation(literalCapacity: 0, interpolationCount: 0)
        stringInterpolation.appendLiteral(value)
    }

    public init(stringInterpolation value: Self.StringInterpolation) {
        stringInterpolation = value
    }
}

