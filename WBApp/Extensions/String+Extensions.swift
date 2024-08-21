//
//  String+Extensions.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import Foundation

//MARK: - for Common app
extension String.StringInterpolation {
	mutating func appendInterpolation(_ value: Int?, units: String) {
		if let value = value {
			appendInterpolation("\(value) \(units)")
			if value > 1 {
				appendLiteral("s")
			}
		}
	}
}
