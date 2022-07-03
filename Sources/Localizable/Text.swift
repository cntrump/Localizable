//
//  Text.swift
//  
//
//  Created by Lvv.me on 2022/7/3.
//

import Foundation

public func Text(_ localizableString: LocalizedStringKey,
                           tableName: String? = nil,
                              bundle: Bundle? = nil,
                             comment: StaticString? = nil) -> String {
    var bdl = bundle
    if bdl == nil {
        bdl = .main
    }

    let placeholder = "\u{fffe}\u{fcfb}"
    let key = localizableString.key
    let value = bdl!.localizedString(forKey: key, value: placeholder, table: tableName)

    guard !value.elementsEqual(placeholder) else {
        return localizableString.description
    }

    let args = localizableString.args

    return args.isEmpty ? value : String(format: value, arguments: args)
}
