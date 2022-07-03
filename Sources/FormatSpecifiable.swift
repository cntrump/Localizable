//
//  FormatSpecifiable.swift
//  
//
//  Created by Lvv.me on 2022/7/3.
//

import Foundation

public protocol FormatSpecifiable {

    associatedtype _Arg: CVarArg

    var _arg: _Arg { get }

    var _specifier: String { get }
}

