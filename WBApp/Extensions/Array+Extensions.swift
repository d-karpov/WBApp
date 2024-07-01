//
//  Array+Extensions.swift
//  WBApp
//
//  Created by Денис Карпов on 01.07.2024.
//

import Foundation

extension Array {
	subscript(safe index: Index) -> Element? {
		indices ~= index ? self[index] : nil
	}
}
