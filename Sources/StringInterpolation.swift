//
//  StringInterpolation.swift
//
//
//  Created by Lvv.me on 2022/7/3.
//

import Foundation

extension LocalizedStringKey.StringInterpolation {

    public mutating func appendInterpolation<T>(_ literal: T) where T: FormatSpecifiable {
        appendInterpolation(literal._arg, specifier: literal._specifier)
    }
}

extension LocalizedStringKey.StringInterpolation {

    public mutating func appendInterpolation(_ literal: Int) {
        appendInterpolation(literal, specifier: "%ld")
    }

    public mutating func appendInterpolation(_ literal: Double) {
        appendInterpolation(literal, specifier: "%f")
    }

    public mutating func appendInterpolation(_ literal: String) {
        appendInterpolation(literal, specifier: "%@")
    }

    public mutating func appendInterpolation(_ literal: URL) {
        appendInterpolation(literal.absoluteString, specifier: "%@")
    }

    public mutating func appendInterpolation(_ literal: Any) {
        appendInterpolation(String(describing: literal), specifier: "%@")
    }
}

extension LocalizedStringKey.StringInterpolation {

    public mutating func appendInterpolation(number: Float, minimumFractionDigits: Int = 0, maximumFractionDigits: Int = 2) {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = minimumFractionDigits
        formatter.maximumFractionDigits = maximumFractionDigits

        guard let arg = formatter.string(from: NSNumber(value: number)) else { return }

        appendInterpolation(arg)
    }

    public mutating func appendInterpolation(date: Date, dateFormat: String = "yyyy/M/d") {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        appendInterpolation(formatter.string(from: date))
    }
}

